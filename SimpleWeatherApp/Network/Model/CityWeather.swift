//
//  CityWeather.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

import Foundation

struct CityWeather: Identifiable {
    let id = UUID()
    let city: String
    let weatherCondition: WeatherCondition

    var weatherConditionIcon: String {
        /*
         https://openweathermap.org/img/wn/10d@2x.png
         */
        AppConfiguration.OpenWeather.weatherIconURLString + "\(weatherCondition.weather.first?.icon ?? "")@2x.png"
    }
}
