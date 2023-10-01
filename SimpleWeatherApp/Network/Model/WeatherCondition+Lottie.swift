//
//  WeatherCondition+Lottie.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 30.9.2023.
//

import Foundation

/**
 Simple mapping from the default OpenWeather icon to corresponding animation file
 */
extension WeatherCondition {
    var weatherAnimationName: String {
        switch weather.first?.icon {
        case "01d", "01n":
            return "clearSky"
        case "02d", "02n":
            return "fewClouds"
        case "03d", "03n":
            return "scatterClouds"
        case "04d", "04n":
            return "brokenClouds"
        case "09d", "09n":
            return "showerRain"
        case "10d", "10n":
            return "rain"
        case "11d", "11n":
            return "thunderStorm"
        case "13d", "13n":
            return "snow"
        case "50d", "50n":
            return "mist"
        default:
            return "clearSky"
        }
    }
}
