//
//  CustomTileWind.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-27.
//

import SwiftUI

struct CustomTileWind: View {

    @Binding var direction: String
    @Binding var speed: Double
    @Binding var windDegree: Double
    
    var majorTickCount = 12
    var majorTickLength: CGFloat = 10
    var minorTickCount = 3
    var minorTickLength: CGFloat = 5
    
    var body: some View {
        
        CustomUISquarTile(tileTitle: .constant("Wind Details")) {
            
            VStack {
                
                Spacer()
                
                HStack(alignment: VerticalAlignment.center) {
                    
                    VStack(alignment: HorizontalAlignment.center, spacing: 5) {
                        
                        Text(direction)
                            .font(.headline)
                        
                        VStack(spacing: 0) {
                            
                            Text("\(Int(round(speed)))")
                                .font(.largeTitle)
                            
                            Text("\( Constants().isSpeedKPH ? "km/h" : "mph")")
                                .font(.caption)
                            
                        }
                        
                        
                    }
                    
                    ZStack {
                        GeometryReader { geometry in
                            ZStack {
                                
                                Path { path in
                                    let center = CGPoint(x: geometry.size.width / 2, y: geometry.size.height / 2)
                                    let radius = min(geometry.size.width, geometry.size.height) / 2 - 10
                                    
                                    let majorTickAngle = 2 * CGFloat.pi / CGFloat(majorTickCount)
                                    let minorTickAngle = majorTickAngle / CGFloat(minorTickCount + 1)
                                    
                                    for i in 0..<majorTickCount {
                                        let angle = CGFloat(i) * majorTickAngle
                                        
                                        // Major ticks
                                        let start = CGPoint(
                                            x: center.x + radius * cos(angle),
                                            y: center.y + radius * sin(angle)
                                        )
                                        let end = CGPoint(
                                            x: center.x + (radius + majorTickLength) * cos(angle),
                                            y: center.y + (radius + majorTickLength) * sin(angle)
                                        )
                                        
                                        path.move(to: start)
                                        path.addLine(to: end)
                                        
                                        // Minor ticks
                                        for j in 1..<minorTickCount + 1 {
                                            let minorAngle = angle + CGFloat(j) * minorTickAngle
                                            let minorStart = CGPoint(
                                                x: center.x + radius * cos(minorAngle),
                                                y: center.y + radius * sin(minorAngle)
                                            )
                                            let minorEnd = CGPoint(
                                                x: center.x + (radius + minorTickLength) * cos(minorAngle),
                                                y: center.y + (radius + minorTickLength) * sin(minorAngle)
                                            )
                                            
                                            path.move(to: minorStart)
                                            path.addLine(to: minorEnd)
                                        }
                                    }
                                }
                                .stroke(Color.black.opacity(0.3), lineWidth: 2)
                            }
                        }
                        .aspectRatio(1, contentMode: .fit)
                        .padding(.vertical, 15)
                        
                        
                        Image(systemName: "arrow.up")
                            .resizable()
                            .frame(width: 20, height: 50)
                            .fontWeight(.light)
                            .rotationEffect(.degrees(windDegree - 180))
                            .foregroundStyle(.red)
                        
                    }
                }
                
                Spacer()
                
            }
            .foregroundStyle(Color.black.opacity(0.6))
            
        }
    }
}

#Preview {
    CustomTileWind(direction: .constant("NW"), speed: .constant(23), windDegree: .constant(315))
}
