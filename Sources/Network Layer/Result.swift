//
//  Result.swift
//  SwiftUI-MVVM-Base
//
//  Created by Amit on 10/01/20.
//  Copyright © 2020 MAC104. All rights reserved.
//

import Foundation
import Combine

enum Resultable<T> {

    case success(T)
    case failure(Error)

    var value: T? {
        switch self {
        case let .success(value): return value
        default: return nil
        }
    }
    
    var error: Error? {
        switch self {
        case let .failure(error): return error
        default: return nil
        }
    }
}

extension Resultable: Equatable where T: Equatable {
    static func == (lhs: Resultable<T>, rhs: Resultable<T>) -> Bool {
        switch (lhs, rhs) {
        case let (.success(lhsV), .success(rhsV)): return lhsV == rhsV
        case let (.failure(lhsE), .failure(rhsE)):
            return lhsE.localizedDescription == rhsE.localizedDescription
        default: return false
        }
    }
}


extension Publisher {
    func sinkResult(_ result: @escaping (Resultable<Output>) -> Void) -> AnyCancellable {
        return sink(receiveCompletion: { completion in
            switch completion {
            case let .failure(error):
                result(.failure(error))
            default: break
            }
        }, receiveValue: { value in
            result(.success(value))
        })
    }
    
    @discardableResult
    func onSink(receiveValue: @escaping ((Self.Output) -> Void)) -> AnyCancellable
    {
        return sink(receiveCompletion: { _ in }, receiveValue: { value in
            receiveValue(value)
        })
    }
}


class CancelBag {
    var subscriptions = Set<AnyCancellable>()
}

extension AnyCancellable {
    static var cancelled: AnyCancellable {
        let cancellable = AnyCancellable({ })
        cancellable.cancel()
        return cancellable
    }
    
    func store(in cancelBag: CancelBag) {
        cancelBag.subscriptions.insert(self)
    }
}
