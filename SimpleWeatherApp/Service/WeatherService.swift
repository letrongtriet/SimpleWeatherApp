//
//  WeatherService.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

protocol WeatherService {
    func fetchWeather(for city: String) async throws -> WeatherCondition
    func fetchWeather(for cities: [String]) async throws -> [CityWeather]
}

struct WeatherServiceImplementation: WeatherService {
    func fetchWeather(for city: String) async throws -> WeatherCondition {
        let geodecodedLocation = try await GeodecodingRequest(cityName: city).execute()
        return try await WeatherRequest(coordinate: geodecodedLocation.coordinate).execute()
    }

    func fetchWeather(for cities: [String]) async throws -> [CityWeather] {
        try await cities.asyncMap { city in
            let weatherCondition = try await fetchWeather(for: city)
            return .init(city: city, weatherCondition: weatherCondition)
        }
    }
}
