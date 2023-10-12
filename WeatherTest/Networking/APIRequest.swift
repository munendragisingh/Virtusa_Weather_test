//
//  APIRequest.swift
//  OpenWeather
//
//  Created by Pratap Singh on 10/12/23.
//

import Foundation

class APIRequest {
    let method: HTTPMethod
    let path: String
    var body: Data?

    init(method: HTTPMethod, path: String) {
        self.method = method
        self.path = path
    }
}
