//
//  Condition.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import Foundation

struct ConditionDTO: Decodable, Hashable {
    let text: String
    let icon: String
    let code: Int
}
