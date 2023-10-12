//
//  SessionProtocol.swift
//  OpenWeather
//
//  Created by Pratap Singh on 10/11/23
//

import Foundation

protocol SessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> DataTaskProtocol
}

protocol DataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: DataTaskProtocol {}

extension URLSession: SessionProtocol {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> DataTaskProtocol {
        let sessionDataTask: URLSessionDataTask = dataTask(with: request, completionHandler: completionHandler)
        return sessionDataTask
    }
}
