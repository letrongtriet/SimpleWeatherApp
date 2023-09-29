//
//  WeatherCondition.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

struct WeatherCondition: APIResponse {
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
}

struct Main: Codable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity, seaLevel, grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

struct Wind: Codable {
    let speed: Double
    let deg: Int?
    let gust: Double?
}

