//
//  WeatherListViewModelTests.swift
//  SimpleWeatherAppTests
//
//  Created by Triet Le on 30.9.2023.
//

import XCTest
@testable import SimpleWeatherApp

final class WeatherListViewModelTests: XCTestCase {
    let failService = MockFailWeatherService()
    let successService = MockSuccessWeatherService()

    lazy var failViewModel = WeatherListViewModel(service: failService)
    lazy var successViewModel = WeatherListViewModel(service: successService)

    func testViewModelFetchDataFail() async {
        XCTAssertEqual(failViewModel.state, .loading)
        await failViewModel.fetchWeatherList()
        XCTAssertEqual(failViewModel.state, .retry)
    }

    func testViewModelFetchDataSuccess() async {
        XCTAssertEqual(successViewModel.state, .loading)
        await successViewModel.fetchWeatherList()
        XCTAssertEqual(successViewModel.state, .results([mockCityWeather]))
    }
}
