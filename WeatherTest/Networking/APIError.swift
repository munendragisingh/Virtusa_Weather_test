//
//  APIError.swift
//  OpenWeather
//
//  Created by Pratap Singh on 10/11/23
//

import Foundation

enum APIError: Error {
    case invalidURL
    case requestFailed
    case decodingFailure
    case noInternet
}
