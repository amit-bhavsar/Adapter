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
    func call<T: Codable>(api route: Router, type: T.Type) -> AnyPublisher<T?, WebError>
}


extension WebServiceProtocol
{
    @discardableResult
    func call<T: Codable>(api route: Router, type: T.Type) -> AnyPublisher<T?, WebError>
    {
        return call(api: route, type: type)
    }
}
