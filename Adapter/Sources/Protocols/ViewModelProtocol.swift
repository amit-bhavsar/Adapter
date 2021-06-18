//
//  ViewModel.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 14/06/21.
//

import Foundation

protocol ViewModelProtocol: ObservableObject
{
}

/*
final class TestViewModel : ViewModel, StateFul, Navigable, API
{
    @Published var state: ViewState = .none
    var navigator: MovieListNavigator
    var interactor: MovieListInteractor
    
    init() {
        navigator = MovieListNavigator()
        interactor = MovieListInteractor()
    }
    
    func onNext(destination: MovieListNavigator.Destination) {
        
    }
    
    func callAPI() {
        
    }
}
*/
