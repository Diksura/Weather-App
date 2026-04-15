//
//  Astro.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import Foundation

struct AstroDTO: Decodable, Hashable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moonPhase: String
    let moonIllumination: Double
    let isMoonUp: Int
    let isSunUp: Int
    
    enum CodingKeys: String, CodingKey {
        case sunrise
        case sunset
        case moonrise
        case moonset
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

