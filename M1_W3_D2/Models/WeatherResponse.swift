//
//  WeatherResponse.swift
//  M1_W3_D2
//
//  Created by Taibah Valley Academy on 3/17/25.
//

import Foundation

struct WeatherResponse: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}
