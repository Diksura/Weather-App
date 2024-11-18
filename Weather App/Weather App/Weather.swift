//
//  Weather.swift
//  Weather App
//
//  Created by Pasan Diksura on 2024-11-18.
//

import Foundation

struct WeatherDTO {
    
}

struct LocationDTO: Decodable, Hashable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzID: String
    let localtimeEpoch: Double
    let localtime: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case region
        case country
        case lat
        case lon
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime
    }
}
