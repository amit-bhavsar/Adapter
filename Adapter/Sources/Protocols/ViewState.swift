//
//  ViewState.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 18/06/21.
//

import Foundation

enum ViewState {
    case none
    case loading
    case failure(Error)
    case success
}
