//
//  Interactor.swift
//  ArchitectureMVVM
//
//  Created by PCQ233 on 14/06/21.
//

import Foundation

class Interactor
{
    var webService : WebServiceProtocol
    let cancelBag = CancelBag()
    
    init(webService : WebServiceProtocol = Webservice())
    {
        self.webService = webService
    }
    
    
    func call<T: Codable>(api route: Router, type: T.Type, completion: @escaping (Resultable<T>) -> Void)
    {
        webService.call(api: route, type: ABResponse<T>.self).sinkResult { (result) in
            switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let response):
                    //self.movies = result.data ?? []
                    if let data = response?.data {
                        completion(.success(data))
                    } else {
                        //completion(.failure(error))
                    }
                    
            }
        }.store(in: cancelBag)
    }
}
