//
//  CustomTileUV.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-28.
//

import SwiftUI

struct CustomTileUV: View {
    
    @Binding var uvIndex: Double
    let gradient = LinearGradient(gradient: Gradient(colors: [.blue, .green, .yellow, .red]), startPoint: .leading, endPoint: .trailing)

    
    var body: some View {
                
        CustomUISquarTile(tileTitle: .constant("UV Details")) {
            
            VStack(alignment: .trailing) {
                
                Spacer()
                
                HStack(alignment: VerticalAlignment.top) {
                    
                    Image(systemName: "sun.min")
                        .font(.system(size: 48))
                        .padding(.top, 3)
                        .padding(.leading, 3)
                        .foregroundStyle(.black.opacity(0.3))
                    
                    VStack {
                        Text("\(Int(round(uvIndex)))")
                            .font(.system(size: 48))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundStyle(.black.opacity(0.5))

                        Text(uvIndexDescription(uvIndex: uvIndex))
                            .font(.system(size: 14))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .foregroundStyle(.black.opacity(0.5))
                    }
                                            
                }

                Spacer()
                
                Gauge(value: uvIndex, in: 0...12) {
                }
                .gaugeStyle(AccessoryLinearGaugeStyle())
                .tint(gradient)
                
                HStack {
                    
                    Text("Min")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                    Text("Max")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    
                }
                
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 15)

        }

    }
    
    func uvIndexDescription(uvIndex: Double) -> String {
        
        switch uvIndex {
        case 0..<2:
            return "Low"
        case 2..<5:
            return "Moderate"
        case 5..<7:
            return "High"
        case 7..<10:
            return "Very High"
        case 10..<20:
            return "Extreme"
        default:
            return "No Data"

        }
    }
    
}

#Preview {
    CustomTileUV(uvIndex: .constant(2))
}
