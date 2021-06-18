//
//  Navigable.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 18/06/21.
//

import Foundation

public protocol Navigable
{
    associatedtype Navigator
    associatedtype Destination
    var navigator: Navigator { get set }
    func onNext(destination: Destination)
}
