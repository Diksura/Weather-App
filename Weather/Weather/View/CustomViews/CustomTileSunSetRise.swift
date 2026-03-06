//
//  CustomTileSunSetRise.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-29.
//

import SwiftUI

struct CustomTileSunSetRise: View {
    
    @Binding var sunrise: String
    @Binding var sunset: String
    
    var body: some View {
        
        CustomUISquarTile(tileTitle: .constant("Sun Behavior")) {
            
            let uiColours = getColourCombinations(sunrise: sunrise, sunset: sunset)

            VStack {
                
                Spacer()
                
                HStack {
                    
                    Spacer()
                    
                    VStack {
                        
                        Image(systemName: "sunrise")
                            .font(.system(size: 32))
                            .foregroundStyle(uiColours.sunriseColour)
                            .padding(.bottom, 2)
                        
                        
                        Text("Sunrise")
                            .font(.footnote)
                        
                        Text(sunrise)
                            .font(.system(size: 13))
                        
                        
                    }
                    
                    Spacer()
                    
                    Divider()
                        .frame(height: Constants().uiSquareSize * 3 / 5)
                    
                    Spacer()
                    
                    
                    VStack {
                        
                        Image(systemName: "sunset")
                            .font(.system(size: 32))
                            .foregroundStyle(uiColours.sunsetColour)
                            .padding(.bottom, 2)
                        
                        Text("Sunset")
                            .font(.footnote)
                        
                        Text(sunset)
                            .font(.system(size: 13))
                        
                    }
                    
                    Spacer()
                    
                }
                .foregroundStyle(.black.opacity(0.6))
                
                Spacer()

            }
//            .padding(.horizontal, 15)

        }
        
    }
    
    func getColourCombinations(sunrise: String, sunset: String) -> (sunriseColour: Color, sunsetColour: Color) {
        
        let isSunRised: Bool = hasTimePassed(givenTime: sunrise)
        let isSunSeted: Bool = hasTimePassed(givenTime: sunset)
        
        if (!isSunRised && !isSunSeted) {
            return (sunriseColour: .orange.opacity(0.6), sunsetColour: .black.opacity(0.15))
        }
        else if (isSunRised && !isSunSeted) {
            return (sunriseColour: .black.opacity(0.15), sunsetColour: .orange.opacity(0.6))
        }
//        else if (isSunRised && isSunSeted) {
//            return (sunriseColour: .black.opacity(0.4), sunsetColour: .black.opacity(0.4))
//        }
        else {
            return (sunriseColour: .black.opacity(0.2), sunsetColour: .black.opacity(0.2))
        }
        
    }
    
    func hasTimePassed(givenTime: String) -> Bool {
        // current time
        let currentDate = Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"  // Format to match "06:05 AM"
        
        guard let givenDate: Date = dateFormatter.date(from: givenTime) else {
            print("Invalid time format")
            return false
        }
        
        let calendar = Calendar.current
        
        let currentTime = calendar.startOfDay(for: currentDate)
        let comparisonTime = calendar.startOfDay(for: givenDate)
        
        return currentTime > comparisonTime
    }

    
}

#Preview {
    CustomTileSunSetRise(sunrise: .constant("4.00 AM"), sunset: .constant("5.00 PM"))
}
