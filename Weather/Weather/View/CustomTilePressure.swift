//
//  CustomTilePressure.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-27.
//

import SwiftUI

struct CustomTilePressure: View {
    
    @Binding var pressureMb: Double
    @Binding var pressureIn: Double
    var colurs: [Color] = [Color("Color-Begin").opacity(0.7), Color("Color-End").opacity(0.7)]
    
    var body: some View {
        
//        CustomUISquarTile(tileTitle: .constant("Pressure Details")) {
            
            ZStack {
                ZStack {
                    
                    Circle()
                        .trim(from: 0.0, to: 0.7)
                        .stroke(Color.black.opacity(0.05), lineWidth: 10)
                        .rotationEffect(.degrees(145))
                    
                    Circle()
                        .trim(from: 0.0, to: meterValue(pressureMb: pressureMb))
                        .stroke(AngularGradient(gradient: .init(colors: self.colurs), center: .center, angle: .degrees(0)), lineWidth: 10)
                        .rotationEffect(.degrees(145))
                    
                }
                
                VStack(spacing: 0) {
                    Text(pressureTypeValue(pressureMb: pressureMb, pressureIn: pressureIn, pressureType: Constants().pressureUnitType))
                        .font(.largeTitle)
                        .foregroundStyle(.black.opacity(0.6))
                    
                    Text(pressureUnitValue(pressureType: Constants().pressureUnitType))
                        .foregroundStyle(.black.opacity(0.6))
                }
                .offset(y: 15)
                
            }
            .padding(3)
            
            
//        }
        
    }
    
    
    
    func pressureTypeValue(pressureMb: Double, pressureIn: Double, pressureType: PressureUnits) -> String{
        
        switch pressureType {
        case .hPa:
            return String(format: "%.0f", pressureMb)
        case .kPa:
            return String(format: "%.1f", pressureMb / 10)
        case .mbHg:
            return String(format: "%.0f", pressureMb)
        case .inHg:
            return String(format: "%.1f", pressureIn)
        }
    }
    
    func pressureUnitValue(pressureType: PressureUnits) -> String{
        
        switch pressureType {
        case .hPa:
            return String(PressureUnits.hPa.rawValue)
        case .kPa:
            return String(PressureUnits.kPa.rawValue)
        case .mbHg:
            return String(PressureUnits.mbHg.rawValue)
        case .inHg:
            return String(PressureUnits.inHg.rawValue)
        }
    }
    
    func meterValue(pressureMb: Double) -> Double {
        let minPressure = 850.0
        let maxPressure = 1100.0
        let minCode = 0.0
        let maxCode = 0.7
        
        let codeValue = (pressureMb - minPressure) * (maxCode - minCode) / (maxPressure - minPressure) + minCode
        return codeValue
    }
    
}

enum PressureUnits: String {
    case kPa = "kPa"
    case hPa = "hPa"
    case mbHg = "mbHg" // Millibar Mercury
    case inHg = "inHg" // Inches Mercury
}


#Preview {
    CustomTilePressure(pressureMb: .constant(1000), pressureIn: .constant(20.2))
}
