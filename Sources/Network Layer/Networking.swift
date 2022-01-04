//
//  Networking.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 21/01/20.
//  Copyright © 2020 MAC104. All rights reserved.
//

import Foundation
import Alamofire

public protocol Networking
{
    @discardableResult
    func request( _ url : URLConvertible, method : HTTPMethod, parameters : Parameters?, encoding : ParameterEncoding, headers : HTTPHeaders?) -> NetworkingRequest
    
    func cancelAllRequest()
}

public protocol NetworkingRequest
{
    @discardableResult
    func responseJSON(completionHandler : @escaping (AFDataResponse<Any>) -> Void) -> Self
    
    @discardableResult
    func responseData(completionHandler : @escaping (AFDataResponse<Data>) -> Void) -> Self
    
    @discardableResult
    func publishData() -> DataResponsePublisher<Data>
    
    @discardableResult
    func publishDecodable<T: Decodable>(type: T.Type) -> DataResponsePublisher<T>
    
    @discardableResult
    func serializingDecodable<T: Decodable>(_ type: T.Type) -> DataTask<T>
}


public final class AlamofireNetwork : Networking
{
    private let alamofireSessionManager : Session
    public static var configuration : URLSessionConfiguration!
    {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForResource = 600
        config.timeoutIntervalForRequest  = 600
        return config
    }
    
    public init(alamofireSessionManager : Session = Session(configuration : AlamofireNetwork.configuration))
    {
        self.alamofireSessionManager = alamofireSessionManager
    }
    
    
    // MARK: - Networking
    public func request(
        _ url : URLConvertible,
        method : HTTPMethod,
        parameters : Parameters?,
        encoding : ParameterEncoding,
        headers : HTTPHeaders?)
        -> NetworkingRequest
    {
        let alamofireRequest = alamofireSessionManager.request(url, method : method, parameters : parameters, encoding : encoding, headers : headers)
        return AlamofireNetworkRequest(alamofireRequest: alamofireRequest)
    }
    
    
    public func cancelAllRequest()
    {
        alamofireSessionManager.session.getTasksWithCompletionHandler { (dataTasks, uploadTasks, downloadTasks) in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
    }
}


public class AlamofireNetworkRequest : NetworkingRequest
{
    private let alamofireRequest : DataRequest
    public init(alamofireRequest : DataRequest)
    {
        self.alamofireRequest = alamofireRequest
    }
    
    @discardableResult
    public func responseJSON(completionHandler : @escaping (AFDataResponse<Any>) -> Void) -> Self
    {
        alamofireRequest.responseJSON(completionHandler : completionHandler)
        return self
    }
    
    
    @discardableResult
    public func responseData(completionHandler : @escaping (AFDataResponse<Data>) -> Void) -> Self
    {
        alamofireRequest.responseData(completionHandler : completionHandler)
        return self
    }
    
    
    @discardableResult
    public func publishData() -> DataResponsePublisher<Data>
    {
        return alamofireRequest.publishData()
    }
    
    
    @discardableResult
    public func publishDecodable<T: Decodable>(type: T.Type) -> DataResponsePublisher<T>
    {
        return alamofireRequest.publishDecodable()
    }
    
    
    @discardableResult
    public func serializingDecodable<T: Decodable>(_ type: T.Type) -> DataTask<T> {
        return alamofireRequest.serializingDecodable(T.self)
    }
}
