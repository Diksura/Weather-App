//
//  CustomHourWeatherUI.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-24.
//

import SwiftUI

struct CustomHourWeatherUI: View {
    @Binding var hour: String
    @Binding var image: String
    @Binding var precipitation: String
    @Binding var temperature: String
    
    var body: some View {
        VStack(spacing: 0) {
            Text(hour)
                .font(.caption)
                .foregroundStyle(.primary.opacity(0.7))
            
            Image(image)
                .resizable()
                .frame(width: Constants().uiSquareSize/5, height: Constants().uiSquareSize/5)
            
            Text(precipitation)
                .font(.system(size: 9))
                .fontWeight(.bold)
                .foregroundStyle(.primary.opacity(0.7))
            
            Text(temperature)
                .font(.subheadline)
                .foregroundStyle(.primary.opacity(0.7))
            
        }
        .frame(height: Constants().uiSquareSize/1.8)
        .padding(.horizontal, 20)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)    }
}

#Preview {
    CustomHourWeatherUI(hour: .constant("5AM"), image: .constant("Cloudy"), precipitation: .constant("50%"), temperature: .constant("23*"))
}
