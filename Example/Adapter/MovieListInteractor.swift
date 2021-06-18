//
//  MovieListInteractor.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 17/06/21.
//

import Foundation

final class MovieListInteractor: Interactor {
    func getMovies(completion: @escaping (Resultable<[Movie]>) -> Void) {
        self.call(api: Router.movies, type: [Movie].self) { result in
            completion(result)
        }
    }
}
