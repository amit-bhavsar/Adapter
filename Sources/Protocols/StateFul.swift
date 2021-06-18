//
//  StateFul.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 18/06/21.
//

import Foundation

public protocol StateFul
{
    associatedtype ViewState
    var state: ViewState { get set }
}
