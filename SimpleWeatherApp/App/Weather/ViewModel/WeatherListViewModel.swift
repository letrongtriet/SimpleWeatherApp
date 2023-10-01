//
//  WeatherListViewModel.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Combine
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

    private var cancellable: Cancellable?

    // MARK: - Init
    init(service: WeatherService) {
        self.service = service
    }

    // MARK: - Public methods
    @MainActor
    func start() async {
        await fetchWeatherList()
        startTimer()
    }

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

    func applicationScenePhaseChanged(_ newPhase: ScenePhase) {
        switch newPhase {
        case .background, .inactive:
            // Remove timer since app is not active
            cancellable = nil
        case .active:
            startTimer()
        @unknown default:
            // Remove timer since app is not active
            cancellable = nil
        }
    }

    // MARK: - Private methods
    private func startTimer() {
        // If app is running and there is an active timer -> no need to create again
        guard cancellable == nil else { return }

        // The weather will be updated every 1 minute
        cancellable = Timer.publish(every: 5, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: { [weak self] _ in
                self?.updateData()
            })
    }

    private func updateData() {
        Task {
            await fetchWeatherList()
        }
    }
}
