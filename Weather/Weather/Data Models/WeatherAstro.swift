//
//  WeatherAstroViewModel.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import Foundation

struct WeatherAstroDTO: Decodable, Hashable {
    let location: LocationDTO
    let astronomy: AstronomyDTO
}

struct AstronomyDTO: Decodable, Hashable {
    let astro: AstroDTO
}
