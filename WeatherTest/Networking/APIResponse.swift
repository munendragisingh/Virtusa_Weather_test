//
//  APIResponse.swift
//  OpenWeather
//
//  Created by Pratap Singh on 10/11/23
//

import Foundation

struct APIResponse<Body> {
    let statusCode: Int
    let body: Body
}

extension APIResponse where Body == Data? {
    func decode<BodyType: Decodable>(to type: BodyType.Type) throws -> APIResponse<BodyType> {
        guard let data = body else {
            throw APIError.decodingFailure
        }
        let jsonDecoder = JSONDecoder()
        let decodedJSON = try jsonDecoder.decode(type, from: data)
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return APIResponse<BodyType>(statusCode: self.statusCode,
                                     body: decodedJSON)
    }
}
