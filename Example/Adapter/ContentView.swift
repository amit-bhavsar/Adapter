//
//  ContentView.swift
//  Adapter
//
//  Created by PCQ233 on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    
    var interactor: MovieListInteractor
    
    init() {
        interactor = MovieListInteractor()
    }
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
    
    func callAPI() async {
        let result = await interactor.getMoviesAwait()
        switch result {
        case .failure(let error):
            print("Request failed due to: \(error)")
            //self.state = .failure(error)
        case .success(let data):
            print("Request finished. \(data)")
            //self.state = .success
            //self.movies = data
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
