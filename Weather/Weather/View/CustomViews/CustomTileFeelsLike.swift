//
//  CustomTileFeelsLike.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-27.
//

import SwiftUI

struct CustomTileFeelsLike: View {
    
    @Binding var feelslike: Double?
    @Binding var windchill: Double?
    @Binding var heatindex: Double?
    
    var body: some View {
        
        CustomUIRectangleTile(tileTitle: .constant("Feels like, wind chill Details"), height: nil) {
            
            VStack(spacing: 0){
                Spacer()
                
                HStack {
                    VStack {
                        
                        HStack(spacing: 0) {
                            VStack(alignment: HorizontalAlignment.leading) {
                                Text("Feels like:")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black.opacity(0.6))
                                
                                Divider()
                                
                                Text("Wind chill:")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black.opacity(0.6))
                                
                                Divider()
                                
                                Text("Heat Index:")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black.opacity(0.6))
                            }
                            
                            VStack(alignment: HorizontalAlignment.leading) {
                                Text("\(feelslike ?? 0, specifier: "%.1f")°C")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black.opacity(0.6))
                                
                                Divider()
                                    .padding(.trailing, 40)
                                
                                Text("\(windchill ?? 0, specifier: "%.1f")°C")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black.opacity(0.6))
                                
                                Divider()
                                    .padding(.trailing, 40)
                                
                                Text("\(heatindex ?? 0, specifier: "%.1f")°C")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.black.opacity(0.6))
                            }
                        }
                        
                    }
                    
                    Spacer()
                    
                    Image(systemName: "thermometer.sun")
                        .font(.system(size: 42))
                        .padding(.trailing, 30)
                        .foregroundStyle(.black.opacity(0.4))
                    
                    
                }
                .padding(.leading, 15)
                
                Spacer()
            }
            
        }
    }
    
}

#Preview {
    CustomTileFeelsLike(feelslike: .constant(23.9), windchill: .constant(3.9), heatindex: .constant(13.9))
}
