//
//  APIManager.swift
//  RoutableAndMapeableClass
//
//  Created by Ariel Congestri on 17/08/2020.
//  Copyright © 2020 Congestri. All rights reserved.
//

import Foundation
import Alamofire

class APIManager {
    
    private static var baseURL = "http://api.icndb.com"
    
    // You should add here every microservice base url
    enum MicroservicePath: String {
        case backend = ""
    }

    // You can add here some necesary headers to execute a https call
    class func execute(MicroservicePath: MicroservicePath, withObject rout: Routeable, completion: @escaping(Result<Data, NetworkingError>) -> Void) {
        AF.request(baseURL + MicroservicePath.rawValue + rout.path, method: rout.method, parameters: rout.parameters, encoding: rout.encoding, headers: rout.headers).validate().responseJSON { (result) in
            
            guard let data = result.data else {
                completion(.failure(NetworkingError.genericError))
                return
            }
            switch result.result {
            case .success:
                completion(.success(data))
            // you could use AF error or just pass data to crate and error
            case .failure(_):
                //NetworkingError(withData: data)
                completion(.failure(.genericError))
            }
        }
    }
    
}
