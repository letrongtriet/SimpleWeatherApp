//
//  WeatherListViewState.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 30.9.2023.
//

import Foundation

enum WeatherListViewState {
    case loading
    case retry
    case results([CityWeather])
}

extension WeatherListViewState: Equatable {
    static func == (lhs: WeatherListViewState, rhs: WeatherListViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.retry, .retry):
            return true
        case (.results(let lhsItems), .results(let rhsItems)):
            return lhsItems == rhsItems
        default:
            return false
        }
    }
}
