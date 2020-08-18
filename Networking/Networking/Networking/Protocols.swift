//
//  Protocols.swift
//  RoutableAndMapeableClass
//
//  Created by Ariel Congestri on 17/08/2020.
//  Copyright © 2020 Congestri. All rights reserved.
//

import Foundation
import Alamofire

typealias Networkeable =  Routeable & Mapeable 

protocol Routeable {
    
    var path: String { get }
    var method: HTTPMethod { get }
    var encoding: ParameterEncoding { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders { get set }
}

protocol Presentable {
    func isPresentable() -> Bool
}

protocol Mapeable {

    func map<T : Decodable>(from data: Data, ofType response: T.Type) -> T?
}

extension Mapeable {
    func map<T : Decodable>(from data: Data, ofType response: T.Type) -> T? {
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(T.self , from: data)
            return data
        } catch {
            return nil
        }
    }
}
