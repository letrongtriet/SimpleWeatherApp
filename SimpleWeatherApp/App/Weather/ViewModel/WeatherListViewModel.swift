//
//  WeatherListViewModel.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

enum WeatherListViewState {
    case loading
    case retry
    case results([CityWeather])
}

class WeatherListViewModel: ObservableObject {
    // MARK: - Observables
    @Published var state: WeatherListViewState = .loading

    // MARK: - Private variables
    private let service: WeatherService

    // MARK: - Init
    init(service: WeatherService) {
        self.service = service
    }

    // MARK: - Public methods
    @MainActor
    func fetchWeatherList() {
        Task {
            do {
                let result = try await service.fetchWeather(for: AppConfiguration.defaultCities)
                state = .results(result)
            } catch {
                print(error)
                state = .retry
            }
        }
    }
}

