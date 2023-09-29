//
//  GeodecodedLocation.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import CoreLocation
import Foundation

struct GeodecodedLocation: APIResponse {
    let name: String
    let lat, lon: Double

    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
