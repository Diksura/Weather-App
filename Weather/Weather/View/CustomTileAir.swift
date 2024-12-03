//
//  CustomTileAir.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-29.
//

import SwiftUI

struct CustomTileAir: View {
    
    @Binding var airQuality: AirQualityDTO?
    @ObservedObject var constants: Constants
    
    var body: some View {
        
        CustomUIRectangleTile(tileTitle: .constant("Air Details"), height: nil) {
            
            let airUIData = constants.isAirUKDefra
                             ? airQualityBand(index: Int(airQuality?.gbDefraIndex ?? 0))
                             : airQualityBand(index: Int(airQuality?.usEpaIndex ?? 0))
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 20) {
                    
                    VStack(spacing: 0) {
                        
                        HStack(alignment: .firstTextBaseline) {
                            Text("\(Int(constants.isAirUKDefra ? airQuality?.gbDefraIndex ?? 0 : airQuality?.usEpaIndex ?? 0))")
                                .font(.system(size: 68))
                                .foregroundStyle(airUIData.color.opacity(0.5))
                            
                            Text("\(constants.isAirUKDefra ? "GB\nDEFRA" :"US\nEPA")")
                                .font(.system(size: 8))
                                .offset(x: 0, y: -10)

                        }
                        
                        Text("\(airUIData.range)")
                            .font(.caption2)

                    }
                    .foregroundStyle(Color.black.opacity(0.6))
                    
                    Spacer()

                    Text("\(airUIData.band)")
                        .foregroundStyle(Color.black.opacity(0.6))

                    
                    Spacer()
                    
                    Image(systemName: "wind")
                        .font(.system(size: 36))
                        .padding(.bottom, 10)
                        .foregroundStyle(Color.black.opacity(0.3))

                    
                    Spacer()

                }
                .padding(.top, 10)
                .padding(.bottom, 20)
                
                Text("Air Index")
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black.opacity(0.5))
                    .padding(.bottom, 10)

                
                HStack(spacing: 0) {
                    
                    VStack (alignment: .leading){
                        
                        Text("Carbon Monoxide")
                        
                        Divider()
                        
                        Text("Ozone")
                        
                        Divider()

                        Text("Nitrogen dioxide")
                        
                        Divider()

                        Text("Sulphur dioxide")
                        
                        Divider()

                        Text("PM2.5")
                        
                        Divider()

                        Text("PM10")
                        
                    }
                    
                    VStack (alignment: .leading){

                        Text(": \(airQuality?.co ?? 0, specifier: "%.2f") µgm\u{207B}\u{00B3}")

                        Divider()

                        Text(": \(airQuality?.o3 ?? 0, specifier: "%.2f") µgm\u{207B}\u{00B3}")

                        Divider()

                        Text(": \(airQuality?.no2 ?? 0, specifier: "%.2f") µgm\u{207B}\u{00B3}")

                        Divider()

                        Text(": \(airQuality?.so2 ?? 0, specifier: "%.2f") µgm\u{207B}\u{00B3}")

                        Divider()

                        Text(": \(airQuality?.pm2_5 ?? 0, specifier: "%.2f") µgm\u{207B}\u{00B3}")

                        Divider()

                        Text(": \(airQuality?.pm10 ?? 0, specifier: "%.2f") µgm\u{207B}\u{00B3}")
                        
                    }
                    .padding(.trailing, 30)

                }
                .font(.system(size: 13))
                .foregroundStyle(Color.black.opacity(0.5))
                
            }
            .padding(.horizontal, 15)
            .padding(.bottom, 10)
            
        }

    }
    
    func airQualityBand(index: Int) -> (band: String, range: String, color: Color) {
       
        if(constants.isAirUKDefra) {
            
            switch index {
            case 1:
                return ("Low", "0-11 µgm\u{207B}\u{00B3}", .green)
            case 2:
                return ("Low", "12-23 µgm\u{207B}\u{00B3}", .green)
            case 3:
                return ("Low", "24-35 µgm\u{207B}\u{00B3}", .green)
            case 4:
                return ("Moderate", "36-41 µgm\u{207B}\u{00B3}", .yellow)
            case 5:
                return ("Moderate", "42-47 µgm\u{207B}\u{00B3}", .yellow)
            case 6:
                return ("Moderate", "48-53 µgm\u{207B}\u{00B3}", .yellow)
            case 7:
                return ("High", "54-58 µgm\u{207B}\u{00B3}", .orange)
            case 8:
                return ("High", "59-64 µgm\u{207B}\u{00B3}", .orange)
            case 9:
                return ("High", "65-70 µgm\u{207B}\u{00B3}", .orange)
            case 10:
                return ("Very High", "71 or more µgm\u{207B}\u{00B3}", .red)
            default:
                return ("Unknown", "Index out of range", .gray)
            }
            
        } else {
            
            switch index {
            case 1:
                return ("Good", "0.0 – 12.0 µgm\u{207B}\u{00B3}", .green)
            case 2:
                return ("Moderate", "12.1 – 35.4 µgm\u{207B}\u{00B3}", .yellow)
            case 3:
                return ("Unhealthy for Sensitive Groups", "35.5 – 55.4 µgm\u{207B}\u{00B3}", .orange)
            case 4:
                return ("Unhealthy", "55.5 – 150.4 µgm\u{207B}\u{00B3}", .red)
            case 5:
                return ("Very Unhealthy", "150.5 – 250.4 µgm\u{207B}\u{00B3}", .purple)
            case 6:
                return ("Hazardous", "250.5 µgm\u{207B}\u{00B3} or higher", Color(red: 128/255, green: 0, blue: 0)) // Maroon
            default:
                return ("Unknown", "No Data", .gray)
            }
            
        }
        
        
    }
    
    
}

struct PreviewWrapper: View {
    @State private var airQuality: AirQualityDTO? = AirQualityDTO(
        co: 0.3,
        no2: 0.2,
        o3: 0.1,
        so2: 0.05,
        pm2_5: 18.0,
        pm10: 22.0,
        usEpaIndex: 2,
        gbDefraIndex: 4
    )

    var body: some View {
        CustomTileAir(airQuality: $airQuality, constants: Constants())
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

#Preview {
    PreviewWrapper()
}
