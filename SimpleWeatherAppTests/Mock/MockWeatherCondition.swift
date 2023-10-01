//
//  MockWeatherCondition.swift
//  SimpleWeatherAppTests
//
//  Created by Triet Le on 30.9.2023.
//

import Foundation
@testable import SimpleWeatherApp

let mockWeatherCondition = WeatherCondition(
    weather: [
        .init(
            id: 721,
            main: "Haze",
            description: "haze",
            icon: "50n"
        )
    ],
    main: .init(
        temp: 13.42,
        feelsLike: 12.93,
        tempMin: 11.12,
        tempMax: 15.9,
        pressure: 1009,
        humidity: 81,
        seaLevel: nil,
        grndLevel: nil
    ),
    visibility: 10000,
    wind: .init(
        speed: 3.6,
        deg: 170,
        gust: nil
    )
)

let mockCityWeather = CityWeather(city: "London", weatherCondition: mockWeatherCondition)
