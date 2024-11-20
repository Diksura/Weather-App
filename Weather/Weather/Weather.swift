//
//  Weather.swift
//  Weather App
//
//  Created by Pasan Diksura on 2024-11-18.
//

import Foundation

struct WeatherDTO: Decodable, Hashable{
    let location: LocationDTO
    let current: CurrentDTO
}

struct LocationDTO: Decodable, Hashable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzID: String
    let localtimeEpoch: Int
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

struct CurrentDTO: Decodable, Hashable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: ConditionDTO
    let windMph: Double
    let windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMb: Int
    let pressureIn: Double
    let precipMM: Double
    let precipIn: Double
    let humidity: Int
    let cloud: Int
    let feelslikeC: Double
    let feelslikeF: Double
    let windchillC: Double
    let windchillF: Double
    let heatindexC: Double
    let heatindexF: Double
    let dewpointC: Double
    let dewpointF: Double
    let visKm: Int
    let visMi: Double
    let uv: Int
    let gustMph: Double
    let gustKph: Double
    
    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMb = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMM = "precip_mm"
        case precipIn = "precip_in"
        case humidity
        case cloud
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case visKm = "vis_km"
        case visMi = "vis_miles"
        case uv
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
    }
}


struct ConditionDTO: Decodable, Hashable {
    let text: String
    let icon: String
    let code: Int
}
