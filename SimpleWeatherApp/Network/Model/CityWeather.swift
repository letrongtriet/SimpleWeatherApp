//
//  CityWeather.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

struct CityWeather: Identifiable, Equatable {
    let id = UUID()
    let city: String
    let weatherCondition: WeatherCondition
}
