//
//  CustomHourlyForecast.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-24.
//

import SwiftUI

struct CustomHourlyForecast: View {
    
    @Binding var hourWeather: [ForecastHourDTO]?
    @ObservedObject var constants: Constants
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                
                if let hourWeather = hourWeather, !hourWeather.isEmpty {
                    ForEach(hourWeather, id: \.id) { weather in
                        CustomHourWeatherUI(
                            hour: .constant(formatTime(time: weather.time)),
                            image: .constant("\(Utilities().getWeatherImage(code: weather.condition.code))"),
                            precipitation: .constant("\(Int(round(weather.chanceOfRain)))%"),
                            temperature: .constant("\(constants.userSettings.isCelecious ? Int(round(weather.tempC)) : Int(round(weather.tempF)))º")
                        )
                    }
                } else {
                    Text("No data available")
                }
            }
        }
        .padding(10)
        
    }
    
    private func formatTime(time: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // Ensure consistent parsing
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // Match the input format exactly
        
        if let date = dateFormatter.date(from: time) {
            dateFormatter.dateFormat = "ha" // Desired output format (e.g., "8PM")
            return dateFormatter.string(from: date)
        }
        return "N/A"
    }
    
    
    private func roundToNearestInt(_ value: Double) -> Int {
        Int(round(value))
    }

    
}

#Preview {
    
    CustomHourlyForecast(hourWeather: .constant(kForecastHourDTO), constants: Constants())
}


