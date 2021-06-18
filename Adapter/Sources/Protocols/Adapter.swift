//
//  Adapter.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 18/06/21.
//

import Foundation

protocol Adapter
{
    associatedtype ViewModel where ViewModel : ViewModelProtocol
    var viewModel: ViewModel { get set }
}
