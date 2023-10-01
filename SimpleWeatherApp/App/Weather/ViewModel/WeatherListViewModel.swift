//
//  WeatherListViewModel.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import SwiftUI

class WeatherListViewModel: ObservableObject {
    // MARK: - Observables
    @Published var state: WeatherListViewState = .loading

    // MARK: - Private variables
    private let service: WeatherService
    
    private var cities: [String] = [
        "Gothenburg",
        "Stockholm",
        "Mountain View",
        "London",
        "New York",
        "Berlin"
    ]

    // MARK: - Init
    init(service: WeatherService) {
        self.service = service
    }

    // MARK: - Public methods
    @MainActor
    func fetchWeatherList() async {
        do {
            let result = try await service.fetchWeather(for: cities)
            state = .results(result)
        } catch {
            print(error)
            state = .retry
        }
    }
}

