//
//  CustomHourlyForecast.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-24.
//

import SwiftUI

struct CustomHourlyForecast: View {
    
    @Binding var hourWeather: [ForecastHourDTO]?
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                
                if let hourWeather = hourWeather, !hourWeather.isEmpty {
                    ForEach(hourWeather, id: \.id) { weather in
                        CustomHourWeatherUI(
                            hour: .constant(formatTime(time: weather.time)),
                            image: .constant("\(Utilities().getWeatherImage(code: weather.condition.code))"),
                            precipitation: .constant("\(Int(round(weather.chanceOfRain)))%"),
                            temperature: .constant("\(Int(round(weather.tempC)))º")
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
    let mockHourWeather: [ForecastHourDTO] = [
        ForecastHourDTO(
            timeEpoch: 1,
            time: "2024-11-25 09:00",
            tempC: 23.0,
            tempF: 73.4,
            isDay: 1,
            condition: ConditionDTO(text: "Cloudy", icon: "", code: 0),
            windMph: 10.0,
            windKph: 16.1,
            windDegree: 90,
            windDir: "E",
            pressureMb: 1013.0,
            pressureIn: 29.91,
            precipMM: 0.0,
            precipIn: 0.0,
            snowCm: 0.0,
            humidity: 60.0,
            cloud: 75.0,
            feelslikeC: 24.0,
            feelslikeF: 75.2,
            windchillC: 0.0,
            windchillF: 0.0,
            heatindexC: 24.0,
            heatindexF: 75.2,
            dewpointC: 16.0,
            dewpointF: 60.8,
            willItRain: 1,
            chanceOfRain: 50.0,
            willItSnow: 0,
            chanceOfSnow: 0.0,
            visKm: 10.0,
            visMi: 6.2,
            uv: 5.0,
            gustMph: 15.0,
            gustKph: 24.1,
            airQuality: AirQualityDTO(co: 0.0, no2: 0.0, o3: 0.0, so2: 0.0, pm2_5: 0.0, pm10: 0.0, usEpaIndex: 0.0, gbDefraIndex: 0.0)
        ),
        ForecastHourDTO(
            timeEpoch: 2,
            time: "2024-11-25 10:00",
            tempC: 24.0,
            tempF: 75.2,
            isDay: 1,
            condition: ConditionDTO(text: "Sunny", icon: "", code: 1),
            windMph: 12.0,
            windKph: 19.3,
            windDegree: 180,
            windDir: "S",
            pressureMb: 1015.0,
            pressureIn: 29.97,
            precipMM: 0.1,
            precipIn: 0.004,
            snowCm: 0.0,
            humidity: 50.0,
            cloud: 10.0,
            feelslikeC: 25.0,
            feelslikeF: 77.0,
            windchillC: 0.0,
            windchillF: 0.0,
            heatindexC: 25.0,
            heatindexF: 77.0,
            dewpointC: 15.0,
            dewpointF: 59.0,
            willItRain: 0,
            chanceOfRain: 20.0,
            willItSnow: 0,
            chanceOfSnow: 0.0,
            visKm: 10.0,
            visMi: 6.2,
            uv: 6.0,
            gustMph: 18.0,
            gustKph: 28.9,
            airQuality: AirQualityDTO(co: 0.0, no2: 0.0, o3: 0.0, so2: 0.0, pm2_5: 0.0, pm10: 0.0, usEpaIndex: 0.0, gbDefraIndex: 0.0)
        )
    ]
    
    return CustomHourlyForecast(hourWeather: .constant(mockHourWeather))
}

