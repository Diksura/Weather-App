//
//  CLWeatherForecastViewModel.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//
// CLWeatherForecastViewModel --> Current Location Weather Forecast View Mdel


import SwiftUI

struct CLWeatherForecastViewModel {
    
    @ObservedObject var locationService: CurrentLocation
    @Binding var weatherForecastData: WeatherForecastDTO?
    
    
    
    func fetchWeatherForecastData() async {
        
        guard let _ = locationService.location else {
            print("Weather Forecast - Location is not available yet.")
            return
        }
        
                
        // Creating URL
        let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=\(Constants.apiKey)&q=\(locationService.location!.latitude),\(locationService.location!.longitude)&days=3&aqi=yes&alerts=yes")
        guard let unwrappedURL = url else {
            return
        }
        
        print("Weather Forecast - URL: \(unwrappedURL.absoluteString)")
        
        do {
            // initialize URL session
            let (data, response) = try await URLSession.shared.data(from: unwrappedURL)
            
            // check if valid responce
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Weather Forecast - Invalid response")
                return
            }
            
            print("Weather Forecast - Response Code: \(httpResponse.statusCode)")
            
            switch httpResponse.statusCode {
            case 200..<300:
                let decodedData = try JSONDecoder().decode(WeatherForecastDTO.self, from: data)
                weatherForecastData = decodedData
                
                print("Weather Forecast - Successfully Fetched Data")
            case 400..<500:
                print("Weather Forecast - Invalid Request")
            default:
                print("Weather Forecast - Error Fetching Data")
            }
            

        } catch {
            print("Weather Forecast - Error Fetching Data: \(error.localizedDescription)")
        }
        
        
        
        
    }

}
