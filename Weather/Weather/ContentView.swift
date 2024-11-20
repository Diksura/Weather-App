//
//  ContentView.swift
//  Weather App
//
//  Created by Pasan Diksura on 2024-11-18.
//

import SwiftUI

struct ContentView: View {
    
    @State var weatherData: WeatherDTO?
    @StateObject private var locationService = CurrentLocation()

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

            Task {
                await fetchWeatherData()
            }
        }
    }

    
    func fetchWeatherData() async {
                
        // Creating URL
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=838714aecdf04acaad8173636241811&q=6.927079,79.861244&aqi=no")
        guard let unwrappedURL = url else {
            return
        }
        
        do {
            // initialize URL session
            let (data, response) = try await URLSession.shared.data(from: unwrappedURL)
            
            // check if valis responce
            guard let httpResponse = response as? HTTPURLResponse else {
                print("invalid response")
                return
            }
            
            print("Response Code: \(httpResponse.statusCode)")
            
            switch httpResponse.statusCode {
            case 200..<300:
                let decodeData = try JSONDecoder().decode(WeatherDTO.self, from: data)
                weatherData = decodeData
                
                print("Successfully Fetched Data")
            case 400..<500:
                print("Invalis Request")
            default:
                print("Error Fetching Data")
            }
            

        } catch {
            print("Error Fetching Data: \(error.localizedDescription)")
        }
        
        
        
        
    }
}

#Preview {
    ContentView()
}
