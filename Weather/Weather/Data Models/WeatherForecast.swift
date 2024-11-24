//
//  ForcastWeather.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import Foundation

struct WeatherForecastDTO: Decodable, Hashable {
    let location: LocationDTO
    let current: CurrentDTO
    let forecast: ForecastWeather
    let alerts: AlertsDTO
}

struct ForecastWeather: Decodable, Hashable {
    let forecastday: [ForecastDayDTO]
}

