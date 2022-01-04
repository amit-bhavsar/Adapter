//
//  WebError.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 21/01/20.
//  Copyright © 2020 MAC104. All rights reserved.
//

import Foundation

public enum WebError: Error {
    
    /// Throws when server don't give any response
    case noData
    
    /// Throws when internet isn't connected
    case noInternet
    
    /// Throws when server is down because of any reason
    case hostFail
    
    /// Throws when response is not as per predefined json format
    case parseFail
    
    /// Throws when request timeout occurs
    case timeout
    
    /// Throws when server unauthorise user
    case unAuthorise
    
    /// Throws when application cancel running request
    case cancel
    
    /// Throws when error is none of the above
    case unknown
    
    
    public init(_ error: Error)
    {
        if error._code == NSURLErrorTimedOut {
            self = .timeout
        } else if error._code == NSURLErrorCannotConnectToHost {
            self = .hostFail
        } else if error._code == NSURLErrorCancelled {
            self = .cancel
        } else if error._code == NSURLErrorNetworkConnectionLost {
            /*if Device.isReachable == true {
                //Slow Internet connection
            } else {
                //Internet disconnected before completion of request
            }*/
            self = .unknown
        } else {//
            self = .unknown
        }
    }
}
