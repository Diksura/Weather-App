//
//  WeatherAlerts.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import Foundation

struct WeatherAlertsDTO: Decodable, Hashable {
    let location: LocationDTO
    var alerts: AlertsDTO
}
