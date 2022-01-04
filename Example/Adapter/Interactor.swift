//
//  Interactor.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 14/06/21.
//

import Foundation

open class Interactor
{
    public var webService : WebServiceProtocol
    public let cancelBag = CancelBag()
    
    public init(webService : WebServiceProtocol = Webservice())
    {
        self.webService = webService
    }
    
    
    public func call<T: Codable>(api route: Routable, type: T.Type, completion: @escaping (Resultable<T>) -> Void)
    {
        webService.call(api: route, type: ABResponse<T>.self).sinkResult { (result) in
            switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let response):
                    //self.movies = result.data ?? []
                    if let data = response?.data {
                        completion(.success(data))
                    } else {
                        //completion(.failure(error))
                    }
                    
            }
        }.store(in: cancelBag)
    }
    
    
    public func callAwait<T: Codable>(api route: Routable, type: T.Type) async -> Resultable<T> {
        let result = await webService.callAwait(api: route, type: ABResponse<T>.self)
        
        switch result {
        case .failure(let error):
            return .failure(WebError(error))
        case .success(let response):
            if let data = response.data {
                return .success(data)
            } else {
                return .failure(WebError.unknown)
            }
        }
    }
}
