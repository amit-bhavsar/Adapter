//
//  Webservice.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 10/01/20.
//  Copyright © 2020 MAC104. All rights reserved.
//

import Foundation
import Alamofire
import Combine
import Dispatch

final class Webservice: WebServiceProtocol
{
    // Custom header field
    var header = HTTPHeaders(["Content-Type":"application/json"])
    
    private var sessionManager : Networking
    private let cancelBag = CancelBag()
    
    init(sessionManager : Networking = AlamofireNetwork())
    {
        self.sessionManager = sessionManager
    }
    
    static let api = Webservice.init()
    
    /// Set Bearer Token here
    ///
    /// - parameter token: string without bearer prefix for `token`
    func set(authorizeToken token: String) {
        header[""] = token
    }
    
    /// Remove Bearer token with this method
    func removeAuthorizeToken() {
        header.remove(name: "")
    }
    
    func cancelAllTasks() {
        sessionManager.cancelAllRequest()
    }
    
    
    @discardableResult
    func call<T: Codable>(api route: Router, type: T.Type) -> AnyPublisher<T?, WebError>
    {
        /*
        if no internet
        {
            return Just(nil).mapError {_ in
                return WebError.noInternet
            }.eraseToAnyPublisher()
        }
        */
        
        let path = route.path.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed)
        
        var parameter = route.parameters
        if route.parameters == nil {
            parameter = [:]
        }
        
        var encoding: ParameterEncoding = JSONEncoding.default
        if route.method == .get {
            encoding = URLEncoding.default
        }
        
        let request = self.sessionManager.request(path!, method : route.method, parameters : parameter!, encoding : encoding, headers : self.header)
        
        let publisher = request.publishDecodable(type: T.self)
        return publisher.value().mapError {
            let error = $0 as Error
            return WebError(error)
        }.map {
            return $0
        }.eraseToAnyPublisher()
    }
}
