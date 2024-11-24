//
//  CustomHourlyForecast.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-24.
//

import SwiftUI

struct CustomHourlyForecast: View {
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                
                ForEach(0..<12) { index in
                    CustomHourWeatherUI(hour: .constant("5AM"), image: .constant("Cloudy"), precipitation: .constant("50%"), temperature: .constant("23*"))
                }

            }
        }
        .padding(10)
        
    }
}

#Preview {
    CustomHourlyForecast()
}


//CustomHourWeatherUI(
//    hour: .constant(String(hourWeather.time.prefix(2))), // Adjusted time format
//    image: .constant("Cloudy"), // Placeholder image
//    precipitation: .constant("\(hourWeather.chanceOfRain, specifier: "%.0f")%"),
//    temperature: .constant("\(hourWeather.tempC, specifier: "%.0f")º")
//)
