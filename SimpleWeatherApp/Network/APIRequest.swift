//
//  APIRequest.swift
//  SimpleWeatherApp
//
//  Created by Triet Le on 29.9.2023.
//

import Foundation

protocol APIRequest {
    associatedtype Response: APIResponse

    func execute() async throws -> Response
}

protocol APIResponse: Codable {}
