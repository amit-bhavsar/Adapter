//
//  Routable.swift
//  Adapter
//
//  Created by PCQ233 on 18/06/21.
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
