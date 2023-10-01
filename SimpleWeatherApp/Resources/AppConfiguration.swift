//
//  AppConfiguration.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

// Where all basic generic properties of the app
// e.g, base url
struct AppConfiguration {
    struct OpenWeather {
        static let baseURLString = "https://api.openweathermap.org/"
        // Public API key
        static let apiKey = "7a1ccfb55d14e8d98ed9467ffbe85b76"
    }
}
