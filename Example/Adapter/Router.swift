//
//  Router.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 10/01/20.
//  Copyright © 2020 MAC104. All rights reserved.
//

import Foundation
import Alamofire

public protocol Routable {
    var path        : String { get }
    var method      : HTTPMethod { get }
    var parameters  : Parameters? { get }
    var dataKey     : String? { get }
    var isCachable  : Bool { get }
}

public enum Router: Routable, Equatable, Hashable {
    
    case movies
    
    public static func ==(lhs: Router, rhs: Router) -> Bool {
        return lhs.path == rhs.path
    }
}

extension Router {
    public var path: String {
        var endPoint = ""
        
        switch self {
        case .movies:
            endPoint = "movies"
        }
        return "https://60cb0c3321337e0017e43a63.mockapi.io/" + endPoint
    }

}

extension Router {
    public var method: HTTPMethod {
        return .get
    }
}

extension Router {
    public var parameters: Parameters? {
        return nil
    }
}

extension Router {
    public var dataKey: String? {
        switch self {
        case .movies:
            return "results"
        }
    }
}

extension Router {
    public var isCachable: Bool {
        return true
    }
}
