//
//  RepositoryExample.swift
//  RoutableAndMapeableClass
//
//  Created by Ariel Congestri on 17/08/2020.
//  Copyright © 2020 Congestri. All rights reserved.
//

import Foundation

class ReposiroryExample {
    
    func getRamdomJoke(withNetworkeable networkeable: Networkeable, completion: @escaping(Result<RandomJokeResponse, NetworkingError>) -> Void) {
        APIManager.execute(MicroservicePath: .backend, withObject: networkeable) { (result) in
            switch result {
            case .success(let data):
                guard let response = networkeable.map(from: data, ofType: RandomJokeResponse.self) else {
                    completion(.failure(.parseError))
                    return
                }
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
