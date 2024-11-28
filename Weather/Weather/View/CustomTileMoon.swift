//
//  CustomTileMoon.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-28.
//

import SwiftUI

struct CustomTileMoon: View {
    
    @Binding var moonPhase: String
    @Binding var moonIllumination: Double
    @Binding var moonrise: String
    @Binding var moonset: String
    
    var body: some View {
        
        CustomUIRectangleTile(tileTitle: .constant("Moon Details"), height: nil) {
            
            HStack(spacing: 0) {
                HStack (spacing: -20){
                    VStack (alignment: HorizontalAlignment.leading, spacing: 0){
                        
                        Text("Phase")
                        
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        Text("Illumination")
                        
                        Divider()
                            .padding(.vertical, 5)

                        Text("Moon-Rise")
                        
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        Text("Moon-Set")
                        
                        
                    }
                    
                    VStack (alignment: HorizontalAlignment.leading, spacing: 0){
                        
                        Text(": \(moonPhase)")
                        
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        Text(": \(moonIllumination, specifier: "%.1f")")
                        
                        Divider()
                            .padding(.vertical, 5)

                        Text(": \(moonrise)")
                        
                        
                        Divider()
                            .padding(.vertical, 5)
                        
                        Text(": \(moonset)")
                        
                        
                    }
                }
                .padding(.horizontal, 15)
                .foregroundStyle(.black.opacity(0.5))
                .font(.caption)
                .fontWeight(.light)

                
                
                Image("Cloudy-Sunny")
                    .resizable()
                    .frame(width: 140, height: 140)
            }
            
        }
        
    }
}

#Preview {
    CustomTileMoon(moonPhase: .constant("Waning Gibbous"), moonIllumination: .constant(20), moonrise: .constant("7.43 PM"), moonset: .constant("5.43 AM"))
}
