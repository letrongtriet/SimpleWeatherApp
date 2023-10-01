//
//  CityWeather.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

/**
 - Parameters:
    - id: needed properties for SwiftUI list items
    - city: simple string to display city name
    - weatherCondition: `Codable` response from API
 */
struct CityWeather: Identifiable, Equatable {
    let id = UUID()
    let city: String
    let weatherCondition: WeatherCondition
}
