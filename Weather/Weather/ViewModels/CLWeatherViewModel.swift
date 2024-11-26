//
//  CLWeatherViewModel.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-20.
//
// CLWeatherViewModel --> Current Location Weather View Mdel

import SwiftUI

struct CLWeatherViewModel {
    
    @ObservedObject var locationService: CurrentLocation
    @Binding var weatherData: WeatherDTO?
    
    var language: String = ""
    
    
    func fetchWeatherData() async {
        
        guard let _ = locationService.location else {
            print("Location is not available yet.")
            return
        }
        
                
        // Creating URL
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=\(Constants.apiKey)&q=\(locationService.location!.latitude),\(locationService.location!.longitude)&aqi=yes\((!Constants().isLanguageEng) ? "&lang=\(language)" : "")")
        guard let unwrappedURL = url else {
            return
        }
        
        print("URL: \(unwrappedURL.absoluteString)")
        
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
