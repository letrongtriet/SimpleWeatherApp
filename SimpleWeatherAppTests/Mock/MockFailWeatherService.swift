//
//  MockFailWeatherService.swift
//  SimpleWeatherAppTests
//
//  Created by Triet Le on 30.9.2023.
//

import Foundation
@testable import SimpleWeatherApp

final class MockFailWeatherService: WeatherService {
    func fetchWeather(for city: String) async throws -> SimpleWeatherApp.WeatherCondition {
        throw APIError.malformedURLRequest
    }
    
    func fetchWeather(for cities: [String]) async throws -> [SimpleWeatherApp.CityWeather] {
        throw APIError.malformedURLRequest
    }
}
