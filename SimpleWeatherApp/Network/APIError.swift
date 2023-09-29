//
//  APIError.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

enum APIError: CustomNSError {
    case malformedURLRequest
    case error(Error)
}
