//
//  WebServiceProtocol.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 21/01/20.
//  Copyright © 2020 MAC104. All rights reserved.
//

import Foundation
import Combine

public protocol WebServiceProtocol
{
    @discardableResult
    func call<T: Codable>(api route: Routable, type: T.Type) -> AnyPublisher<T?, WebError>
    
    @discardableResult
    func callAwait<T: Codable>(api route: Routable, type: T.Type) async -> Resultable<T>
}


extension WebServiceProtocol
{
    @discardableResult
    func call<T: Codable>(api route: Routable, type: T.Type) -> AnyPublisher<T?, WebError>
    {
        return call(api: route, type: type)
    }
    
    @discardableResult
    public func callAwait<T: Codable>(api route: Routable, type: T.Type) async -> Resultable<T> {
        return await callAwait(api: route, type: type)
    }
}
