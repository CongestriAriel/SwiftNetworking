//
//  Error.swift
//  RoutableAndMapeableClass
//
//  Created by Ariel Congestri on 17/08/2020.
//  Copyright © 2020 Congestri. All rights reserved.
//

import Foundation

struct NetworkingError: Error {

    static var parseError: NetworkingError {
        return NetworkingError(code: 100, description: "There was an error trying to parse JSON", presentableDescription: "There was an error plis contact us.")
    }

    static var genericError: NetworkingError {
        return NetworkingError(code: 500, description: "There was an unknowed error trying to get backend data", presentableDescription: "There was an error plis contact us.")
    }

    var code: Int
    var localizedDescription: String
    var presentableDescription: String

    init(code: Int, description: String, presentableDescription: String = "Error generico") {
        self.code = code
        self.localizedDescription = description
        self.presentableDescription = presentableDescription
    }
    
}
