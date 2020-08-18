//
//  InteractorExample.swift
//  RoutableAndMapeableClass
//
//  Created by Ariel Congestri on 17/08/2020.
//  Copyright © 2020 Congestri. All rights reserved.
//

import Foundation

class InteractorExample {

    let repository = ReposiroryExample()
    
    func getRandomJoke(completion: @escaping(Result<ChuckNorrisJoke, NetworkingError>) -> Void) {
        let networkingObject = RandomJokeCall()
        repository.getRamdomJoke(withNetworkeable: networkingObject) { (result) in
            switch result {
            case .success(let response):
                let entity = ChuckNorrisJoke(from: response)
                guard entity.isPresentable() else {
                    completion(.failure(.genericError))
                    return
                }
                completion(.success(entity))
            case .failure(let error) :
                completion(.failure(error))
            }
        }
    }
}
