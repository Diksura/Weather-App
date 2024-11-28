//
//  CustomTileHumidity.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-27.
//

import SwiftUI

struct CustomTileHumidity: View {
    
    @Binding var humidityLevel: Double?
    
    var body: some View {
        VStack(spacing: 0) {
            
            Spacer()
            
            Image(systemName: "humidity")
                .resizable()
                .frame(width: 40, height: 30)
                .foregroundStyle(.gray.opacity(0.8))
                
                
            
            HStack(alignment: .firstTextBaseline, spacing: 0) {
                Text("\(Int(round(humidityLevel ?? 0)))")
                    .font(.system(size: 54))
                
                Text("%")
                    .font(.title)
            }
            .foregroundStyle(.black.opacity(0.5))
            
            Spacer()
        }
    }
}

#Preview {
    CustomTileHumidity(humidityLevel: .constant(23.0))
}

/**
 
 Humidity Levels and Messages:
 
    0–20%:
        "The air is quite dry. Stay hydrated!"
    21–40%:
        "Low humidity today. It’s comfortable, but drink water to stay refreshed."
    41–60%:
        "The humidity is moderate. Enjoy the day!"
    61–80%:
        "It feels humid outside. Consider wearing light clothing."
    81–100%:
        "High humidity! Perhaps carry an umbrella, just in case."
 
*/
