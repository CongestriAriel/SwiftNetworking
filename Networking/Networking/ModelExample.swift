//
//  CallExampleModel.swift
//  RoutableAndMapeableClass
//
//  Created by Ariel Congestri on 17/08/2020.
//  Copyright © 2020 Congestri. All rights reserved.
//

import Foundation
import Alamofire

//this is a git tests


struct RandomJokeResponse: Decodable {
    var type: String?
    var joke: ChuckNorrisjokeDTO?

    enum CodingKeys: String, CodingKey {
        case type = "type", joke = "value"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.type = try? container.decode(String.self, forKey: .type)
        self.joke = try? container.decode(ChuckNorrisjokeDTO.self, forKey: .joke)
    }
}

struct ChuckNorrisjokeDTO: Decodable {
    var id: Int?
    var joke: String?

    enum CodingKeys: String, CodingKey {
        case id = "id", joke = "joke"
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try? container.decode(Int.self, forKey: .id)
        self.joke = try? container.decode(String.self, forKey: .joke)
    }
}

struct ChuckNorrisJoke: Presentable {
    var type: String
    var id: Int
    var joke: String

    init (from object: RandomJokeResponse) {
        self.type = object.type ?? "N/A"
        self.id = object.joke?.id ?? 0
        self.joke = object.joke?.joke ?? "N/A"
    }

    func isPresentable() -> Bool {
        return (type != "N/A" && id != 0 && joke != "N/A")
    }
}

struct RandomJokeCall: Networkeable {

    var path: String = "/jokes/random"
    var method: HTTPMethod = .post
    var encoding: ParameterEncoding = URLEncoding.default
    var parameters: Parameters? = [:]
    var headers: HTTPHeaders = [:]
}
