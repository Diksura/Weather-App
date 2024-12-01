//
//  Alerts.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import Foundation

struct AlertsDTO: Decodable, Hashable {
    var alert: [AlertDTO]
}

struct AlertDTO: Decodable, Hashable, Identifiable {
    let id: UUID = UUID()
    let headline: String
    let msgtype: String
    let severity: String
    let urgency: String
    let areas: String
    let category: String
    let certainty: String
    let event: String
    let note: String
    let effective: String
    let expires: String
    let description: String
    let instruction: String
    var isCritical: AlertSeverity = AlertSeverity.low
    
    enum CodingKeys: String, CodingKey {
        case headline
        case msgtype
        case severity
        case urgency
        case areas
        case category
        case certainty
        case event
        case note
        case effective
        case expires
        case description = "desc"
        case instruction
    }
}

enum AlertSeverity: String {
    case low = "Low"
    case moderate = "Moderate"
    case extreme = "Extreme"
}
