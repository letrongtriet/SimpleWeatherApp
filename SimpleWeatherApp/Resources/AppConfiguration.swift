//
//  AppConfiguration.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

struct AppConfiguration {
    struct OpenWeather {
        static let baseURLString = "https://api.openweathermap.org/"
        // Public API key
        static let apiKey = "7a1ccfb55d14e8d98ed9467ffbe85b76"
        static let weatherIconURLString = "https://openweathermap.org/img/wn/"
    }

    static let defaultCities = [
        "Gothenburg",
        "Stockholm",
        "Mountain View",
        "London",
        "New York",
        "Berlin"
    ]
}
