//
//  Utilities.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import SwiftUI

class Utilities {
    
    func safeAreaInsetsTotal(requestValue: Int) -> CGFloat {
        /// Request a value to return requred value
        ///     1 --> return the screen hight after reducing the area taken by safearea
        ///     2 --> return the hight taken for bottom of the screen by safearea
        
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
        
        switch requestValue {
        case 1:
            let topInset = keyWindow?.safeAreaInsets.top ?? 0
            let bottomInset = keyWindow?.safeAreaInsets.bottom ?? 0
            return topInset + bottomInset
        case 2:
            return keyWindow?.safeAreaInsets.bottom ?? 0
        default:
            return 0
        }
    }
    
    func roundDouble(value: Double, decimalPoint: Int) -> Double {
        let multiplier = pow(10.0, Double(decimalPoint))
        return round(value * multiplier) / multiplier
    }
    
    func getCurrentDateString() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: currentDate)
    }
    
    func getNextDateString() -> String {
        let currentDate = Date()
        let calendar = Calendar.current
        if let nextDate = calendar.date(byAdding: .day, value: 1, to: currentDate) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: nextDate)
        }
        return "Error calculating next date"
    }

    
    func getCurrentHourString() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH"
        return dateFormatter.string(from: currentDate)
    }
    
    
    func formatDateString(inputDateString: String) -> String {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let date = inputFormatter.date(from: inputDateString) else {
            print("Invalid date string")
            return inputDateString
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "dd EEEE" // Format: "26 Tuesday"
        return outputFormatter.string(from: date)
    }

    func getWeatherImage(code: Int) -> String {
        switch code {
        case 1000:
            return "Sunny" // Sunny/Clear
        case 1003:
            return "Cloudy-Sunny" // Partly cloudy
        case 1006, 1009, 1030, 1135, 1147:
            return "Cloudy-Cold" // Cloudy/Overcast/Mist/Fog/Freezing Fog
        case 1063, 1180, 1183, 1240:
            return "Rain" // Patchy rain/Light rain/Light rain shower
        case 1192, 1195, 1243, 1246:
            return "Heavy-Rain" // Heavy rain/Torrential rain shower
        case 1066, 1210, 1213, 1255:
            return "Snow" // Patchy/Light snow/Light snow showers
        case 1087, 1273, 1276, 1279, 1282:
            return "Cloudy-Thunder" // Thunder/Thunder with rain or snow
        case 1069, 1249:
            return "Rain" // Patchy sleet/Light sleet showers
        case 1114, 1117:
            return "Snow" // Blowing snow/Blizzard
        case 1150, 1153, 1168, 1171, 1198, 1201:
            return "Rain" // Light drizzle/Freezing drizzle/Freezing rain
        case 1204, 1207:
            return "Rain" // Light sleet/Moderate or heavy sleet
        case 1216, 1219, 1222, 1225, 1258:
            return "Snow" // Moderate to heavy snow or snow showers
        case 1237, 1261, 1264:
            return "Snow" // Ice pellets or ice pellet showers
        default:
            return "Temp-Cold" // Default fallback image
        }
    }

    
}
