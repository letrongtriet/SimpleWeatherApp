//
//  WeatherRequest.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation
import CoreLocation

struct WeatherRequest: APIRequest {
    let coordinate: CLLocationCoordinate2D
    private let path = "data/2.5/weather"

    /*
     https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}
     */
    func execute() async throws -> Response {
        let urlString = AppConfiguration.OpenWeather.baseURLString + path
        let url = URL(string: urlString)

        guard var url else {
            throw APIError.malformedURLRequest
        }

        url.appendQueryItem(name: "lat", value: "\(coordinate.latitude)")
        url.appendQueryItem(name: "lon", value: "\(coordinate.longitude)")
        url.appendQueryItem(name: "appid", value: AppConfiguration.OpenWeather.apiKey)
        url.appendQueryItem(name: "units", value: "metric")

        //create a new urlRequest passing the url
        let request = URLRequest(url: url)

        //run the request and retrieve both the data and the response of the call
        let (data, _) = try await URLSession.shared.data(for: request)

        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        return try JSONDecoder().decode(Response.self, from: data)
    }
}

extension WeatherRequest {
    typealias Response = WeatherCondition
}
