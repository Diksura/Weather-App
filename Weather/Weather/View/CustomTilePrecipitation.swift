//
//  CustomTilePrecipitation.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-27.
//

import SwiftUI

struct CustomTilePrecipitation: View {
    
    @Binding var precipitation: Double?
    @ObservedObject var constants: Constants
    
    var body: some View {
        
        CustomUISquarTile(tileTitle: .constant("Precipitation")) {
            
            
            Spacer()
            
            VStack(alignment: HorizontalAlignment.leading) {
                ZStack {
                    HStack(alignment: .firstTextBaseline ,spacing: 0){
                        
                        Text("\(precipitationValue(precipitation: precipitation ?? 0))")
                            .font(.system(size: 48))
                            .foregroundStyle(.black.opacity(0.6))
                        
                        Text("\(constants.isPrecipitationMM ? "mm" : "in")")
                            .foregroundStyle(.black.opacity(0.6))
                        
                        
                    }
                    
                    Image(systemName: "cloud.sun.rain")
                        .font(.system(size: 18))
                        .foregroundStyle(.black.opacity(0.4))
                        .padding(.trailing, 15)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    
                }
                
                Text(precipitationMessage(precipitation: precipitation ?? 0))
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.6))
                
            }
            .padding(.leading, 15)
            .padding(.trailing, 10)
            
            Spacer()
            
            
        }
    }
    
    func precipitationValue(precipitation: Double) -> String {
        if precipitation < 10 {
            return String(format: "%.1f", round(precipitation * 10) / 10)
        } else {
            return "\(Int(round(precipitation)))"
        }
    }
    
    
    func precipitationMessage(precipitation: Double) -> String {
        
        print("CustomTilePrecipitation: Precipitation --> \(precipitation)")
        
        switch precipitation {
        case 0:
            return "No precipitation expected. Enjoy a clear day!"
        case 0..<2.5:
            return "A light drizzle is possible. A hood or light umbrella might suffice."
        case 2.5..<10:
            return "Light rain is expected. Consider carrying an umbrella."
        case 10..<50:
            return "Moderate rain is forecast. An umbrella will likely be needed."
        case 50..<100:
            return "Heavy rain is expected. Make sure you're well-prepared and stay dry."
        case 100...:
            return "Severe rainfall forecast. Exercise caution and avoid unnecessary travel."
        default:
            return "Precipitation data is unavailable. Check local forecasts for updates."
        }
    }
}

#Preview {
    CustomTilePrecipitation(precipitation: .constant(100), constants: Constants())
}
