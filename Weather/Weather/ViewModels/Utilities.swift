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

    
}
