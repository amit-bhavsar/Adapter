//
//  TSResponse.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 10/01/20.
//  Copyright © 2020 MAC104. All rights reserved.
//

import Foundation

public class ABResponse<T:Codable>: Codable {
    private(set) var success : Bool!
    private(set) var data        : T?
    
    enum CodingKeys: String, CodingKey { // declaring our keys
        case success    = "success"
        case data    = "data"
    }
    
    required public init(from decoder: Decoder) throws {
        let values  = try decoder.container(keyedBy: CodingKeys.self)
        success         = try values.decodeIfPresent(Bool.self, forKey : .success)
        data        = try? values.decodeIfPresent(T.self, forKey : .data)
    }
}
