//
//  CustomTileVisibility.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-28.
//

import SwiftUI

struct CustomTileVisibility: View {
    
    @Binding var visibilityKm: Double
    @Binding var visibilityMi: Double
    
    var body: some View {
        
        CustomUISquarTile(tileTitle: .constant("Visibility")) {
            
            VStack {
                
                Spacer()
                
                Image(systemName: "vision.pro")
                    .font(.system(size: 32))
                    .foregroundStyle(.secondary.opacity(0.8))
                
                HStack {
                    
                    Spacer()
                    
                    VStack(spacing: 0){
                        Text("\(Int(round(visibilityKm)))")
                            .font(.largeTitle)
                            .foregroundStyle(.black.opacity(0.6))

                        
                        Text("km")
                            .foregroundStyle(.black.opacity(0.6))

                    }
                    
                    Spacer()
                    
                    Divider()
                        .frame(height: 50)
                    
                    Spacer()
                    
                    VStack(spacing: 0){
                        Text("\(Int(round(visibilityMi)))")
                            .font(.largeTitle)
                            .foregroundStyle(.black.opacity(0.6))
                        
                        Text("mi")
                            .foregroundStyle(.black.opacity(0.6))

                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
            }
            
        }

    }
    
}

#Preview {
    CustomTileVisibility(visibilityKm: .constant(1000), visibilityMi: .constant(60))
}
