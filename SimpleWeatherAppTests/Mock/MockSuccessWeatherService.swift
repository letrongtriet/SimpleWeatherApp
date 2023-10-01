//
//  MockSuccessWeatherService.swift
//  SimpleWeatherAppTests
//
//  Created by Triet Le on 30.9.2023.
//

import Foundation
@testable import SimpleWeatherApp

final class MockSuccessWeatherService: WeatherService {
    func fetchWeather(for city: String) async throws -> SimpleWeatherApp.WeatherCondition {
        mockWeatherCondition
    }
    
    func fetchWeather(for cities: [String]) async throws -> [SimpleWeatherApp.CityWeather] {
        [mockCityWeather]
    }
}
