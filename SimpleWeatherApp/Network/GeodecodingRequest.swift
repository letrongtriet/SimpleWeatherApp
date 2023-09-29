//
//  GeodecodingRequest.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

struct GeodecodingRequest: APIRequest {
    let cityName: String
    private let path = "geo/1.0/direct"

    /*
     http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5&appid={API key}
     */
    func execute() async throws -> Response {
        let urlString = AppConfiguration.OpenWeather.baseURLString + path
        let url = URL(string: urlString)

        guard var url else {
            throw APIError.malformedURLRequest
        }

        url.appendQueryItem(name: "q", value: cityName)
        url.appendQueryItem(name: "limit", value: "1")
        url.appendQueryItem(name: "appid", value: AppConfiguration.OpenWeather.apiKey)

        //create a new urlRequest passing the url
        let request = URLRequest(url: url)

        //run the request and retrieve both the data and the response of the call
        let (data, _) = try await URLSession.shared.data(for: request)

        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        let result = try JSONDecoder().decode([Response].self, from: data)

        //return first item because we only limit to 1
        return result[0]
    }
}

extension GeodecodingRequest {
    typealias Response = GeodecodedLocation
}

