//
//  CLWeatherAlertsViewModel.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import SwiftUI

struct CLWeatherAlertsViewModel {
    
    @ObservedObject var locationService: CurrentLocation
    @Binding var weatherAlertsData: WeatherAlertsDTO?
    
    
    func fetchWeatherAlerts() async {
        
        guard let _ = locationService.location else {
            print("Weather Alert - Location not available")
            return
        }
        
        // Creating URl
        let url = URL(string: "https://api.weatherapi.com/v1/alerts.json?key=\(Constants.apiKey)&q=\(locationService.location!.latitude),\(locationService.location!.longitude)")
        guard let unwrappedURL = url else { return }
        
        print("Weather Alert - URL: \(unwrappedURL.absoluteString)")
        
        do {
            // initialize URL session
            let (data, response) = try await URLSession.shared.data(from: unwrappedURL)
            
            // Check if valid response
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Weather Alert - Invalid Response")
                return
            }
            
            print("Weather Alert - Response Code: \(httpResponse.statusCode)")
            
            switch httpResponse.statusCode {
            case 200..<300:
                let decodedData = try JSONDecoder().decode(WeatherAlertsDTO.self, from: data)
                weatherAlertsData = decodedData
            case 400..<500:
                print("Weather Alert - Invalid Request")
            default :
                print("Weather Alert - Error Decoading Data")
            }
        }
        catch {
            print("Weather Alert - Error Fetching Data: \(error.localizedDescription)")
        }
        
        
    }
    
    
}
