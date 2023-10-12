//
//  WeatherDataModel.swift
//  OpenWeather
//
//  Created by Pratap Singh on 10/11/23
//

import Foundation

struct WeatherModel: Codable {
    var city: String = ""
    var hourly: [WeatherHourly]
    
    enum CodingKeys: String, CodingKey {
        case hourly
    }
}

struct WeatherHourly: Codable {
    let temp: Double
    let time: Int
    let weatherDetail: [WeatherDetail]
    
    enum CodingKeys: String, CodingKey {
        case temp
        case time = "dt"
        case weatherDetail = "weather"
    }
}

struct WeatherDetail: Codable {
    let icon: String
    let weatherDescription: String
    
    enum CodingKeys: String, CodingKey {
        case icon
        case weatherDescription = "description"
    }
}
