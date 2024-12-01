//
//  SettingsPage.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-29.
//

import SwiftUI

struct SettingsPage: View {
    
    @ObservedObject var constants: Constants = Constants()
    
    let firstSectorWidth: CGFloat = 125
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                
                Text("Preferences")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                HStack() {
                    
                    Text("Temperature Unit")
                        .font(.subheadline)
                        .frame(width: firstSectorWidth, alignment: .leading)
                    
                    Text(":")
                        .font(.subheadline)
                    
                    Picker("", selection: $constants.isCelecious) {
                        Text("Celsius").tag(true)
                        Text("Fahrenheit").tag(false)
                    }
                    .pickerStyle(.segmented)
                                        
                }
                
                Divider()
                    .padding(.vertical, 5)
                
                HStack() {
                    
                    Text("Distance Unit")
                        .font(.subheadline)
                        .frame(width: firstSectorWidth, alignment: .leading)
                    
                    Text(":")
                        .font(.subheadline)
                    
                    Picker("", selection: $constants.isDistanceKm) {
                        Text("Km").tag(true)
                        Text("Mi").tag(false)
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Divider()
                    .padding(.vertical, 5)

                HStack() {
                    
                    Text("Speed Unit")
                        .font(.subheadline)
                        .frame(width: firstSectorWidth, alignment: .leading)
                    
                    Text(":")
                        .font(.subheadline)
                    
                    Picker("", selection: $constants.isSpeedKPH) {
                        Text("Km/h").tag(true)
                        Text("Mi/h").tag(false)
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Divider()
                    .padding(.vertical, 5)

                HStack() {
                    
                    Text("Precipitation Unit")
                        .font(.subheadline)
                        .frame(width: firstSectorWidth, alignment: .leading)
                    
                    Text(":")
                        .font(.subheadline)
                    
                    Picker("", selection: $constants.isPrecipitationMM) {
                        Text("Mm").tag(true)
                        Text("In").tag(false)
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Divider()
                    .padding(.vertical, 5)

                HStack() {
                    
                    Text("Air Quality Unit")
                        .font(.subheadline)
                        .frame(width: firstSectorWidth, alignment: .leading)
                    
                    Text(":")
                        .font(.subheadline)
                    
                    Picker("", selection: $constants.isAirUKDefra) {
                        Text("Celsius").tag(true)
                        Text("Fahrenheit").tag(false)
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Divider()
                    .padding(.vertical, 5)

                HStack() {
                    
                    Text("Pressure Unit")
                        .font(.subheadline)
                        .frame(width: firstSectorWidth, alignment: .leading)
                    
                    Text(":")
                        .font(.subheadline)
                    
                    Picker("", selection: $constants.pressureUnitType) {
                        
                        ForEach(PressureUnits.allCases, id: \.self) { pressure in
                            
                            Text("\(pressure.rawValue)").tag(pressure)
                            
                        }
                    }
//                    .pickerStyle(.navigationLink)
                    
                }
                
                Divider()
                    .padding(.vertical, 5)

                HStack() {
                    
                    Text("Language")
                        .font(.subheadline)
                        .frame(width: firstSectorWidth, alignment: .leading)
                    
                    Text(":")
                        .font(.subheadline)
                    
                    Picker("", selection: $constants.languageType) {
                        
                        ForEach(Language.allCases, id: \.self){ language in
                            
                            Text("\(language)").tag(language)
                            
                        }
                    }
                    .padding(.vertical, 10)
                    .pickerStyle(.navigationLink)
                    
                }
                
                Text("Please note that the selected preferred language will only apply to weather condition descriptions")
                    .font(.caption)
                    .foregroundStyle(.black.opacity(0.6))
                                
                Spacer()
                
                VStack{


                    
                    Button("Send Feedback") {
                        
                        // TODO
                    }
                    .buttonStyle(.bordered)
                    
                    Text("Please give us a feedback/suggestion on how to improve the app. We appreciate it!")
                        .multilineTextAlignment(.center)
                        .font(.caption2)
                        .foregroundStyle(.black.opacity(0.7))
                }
                    

            }
//            .navigationBarTitle("Settings")
            .padding()
            .frame(maxWidth: .infinity)

        }

        
    }
}

#Preview {
    SettingsPage()
}
