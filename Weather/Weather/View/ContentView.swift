//
//  ContentView.swift
//  Weather App
//
//  Created by Pasan Diksura on 2024-11-18.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var locationService = CurrentLocation()

    @State var weatherData: WeatherDTO?
    @State var locationAvailable: Bool = false
    

    var body: some View {
        
        NavigationStack {
            
            if let _ = locationService.location {
                ScrollView {
                    VStack {
                        
                        Spacer()
                        
                        VStack{
                            VStack(spacing: 0) {
                                Image("Cloudy-Sunny")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                            

                                Text("\(weatherData?.current.tempC ?? 0, specifier: "%.0f")ºC")
                                    .font(.system(size: 102.0))
                //                    .fontWeight(.bold)
                                    .fontDesign(.rounded)
                            }

                            Text("\(weatherData?.location.name ?? "Unknown Location")")
                                .font(.title)
            //                    .fontWeight(.bold)
                            
                            Text("\(weatherData?.current.condition.text ?? "Unknown Weather")")
                        }
                        
                        Spacer()
                        
                        Image(systemName: "platter.filled.bottom.and.arrow.down.iphone")
                            .padding([.bottom], 1)
                            .foregroundStyle(.gray)
                        
                        Text("Scroll Down for More")
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                    .frame(width: .infinity, height: UIScreen.main.bounds.height - 125)
                    
                    
                    VStack {
                        Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    }
                    .padding(.vertical, 40)
                    
                }
                .scrollIndicators(.hidden)

            
            } else {
                Text("Fetching location...")
            }
            
        }
        .padding()
        .onAppear {
            locationService.requestAuthorization()
        }
        .onChange(of: locationService.isLocationUpdated) {
            if (locationService.isLocationUpdated) {
                Task {
                    await CLWeatherViewModel(locationService: locationService, weatherData: $weatherData).fetchWeatherData()
                }
            }
        }
    }

    
}

#Preview {
    ContentView()
}
