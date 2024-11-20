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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(weatherData?.location.name ?? "Unknown")")
            
            if let location = locationService.location {
                Text("Latitude: \(location.latitude), Longitude: \(location.longitude)")
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
