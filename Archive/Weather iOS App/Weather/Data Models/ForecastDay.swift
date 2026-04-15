//
//  ForcastDay.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import Foundation

struct ForecastDayDTO: Decodable, Hashable {
    let date: String
    let dateEpoch: Int
    let fullDay: ForecastFullDayDTO
    let astro: AstroDTO
    let hourly: [ForecastHourDTO]
    
    enum CodingKeys: String, CodingKey {
        case date
        case dateEpoch = "date_epoch"
        case fullDay = "day"
        case astro
        case hourly = "hour"
    }

}
