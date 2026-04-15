//
//  AirQuality.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import Foundation

struct AirQualityDTO: Decodable, Hashable {
    let co: Double
    let no2: Double
    let o3: Double
    let so2: Double
    let pm2_5: Double
    let pm10: Double
    let usEpaIndex: Double
    let gbDefraIndex: Double
    
    enum CodingKeys: String, CodingKey {
        case co
        case no2
        case o3
        case so2
        case pm2_5
        case pm10
        case usEpaIndex = "us-epa-index"
        case gbDefraIndex = "gb-defra-index"
    }
}
