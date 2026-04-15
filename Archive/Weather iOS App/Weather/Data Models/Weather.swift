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
