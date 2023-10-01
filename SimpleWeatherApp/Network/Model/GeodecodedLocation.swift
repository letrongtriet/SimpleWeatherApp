//
//  GeodecodedLocation.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import CoreLocation
import Foundation

/**
 API response class from OpenWeather after geo decoding city to location coordinate
 */
struct GeodecodedLocation: APIResponse {
    let name: String
    let lat, lon: Double

    // Helper properties for ease of use
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
