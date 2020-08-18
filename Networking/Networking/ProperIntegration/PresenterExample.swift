//
//  PresenterExample.swift
//  RoutableAndMapeableClass
//
//  Created by Ariel Congestri on 17/08/2020.
//  Copyright © 2020 Congestri. All rights reserved.
//

import Foundation

class PresenterExample {

    //Presenter must have a referense to interactor, with tipe InteractorExampleProtocol
    func getJoke() {
        InteractorExample().getRandomJoke { (result) in
            switch result {
            case .success(let joke):
                print(joke.joke)
            case .failure(let error):
                print(error.presentableDescription)
            }
        }
    }
}
