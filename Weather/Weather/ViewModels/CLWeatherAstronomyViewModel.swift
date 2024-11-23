//
//  CLWeatherAstronomyViewModel.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-23.
//

import SwiftUI

struct CLWeatherAstronomyViewModel {
    
    @ObservedObject var locationService: CurrentLocation
    @Binding var weatherAstronomy: WeatherAstroDTO?
    
    
    func fetchWeatherAstronomy() async {
        
        guard let _ = locationService.location else {
            print("Weather Astronomy - Location Data Not Available")
            return
        }
        
        // Creating URL
        let url = URL(string: "https://api.weatherapi.com/v1/astronomy.json?key=\(Constants.apiKey)&q=\(locationService.location!.latitude),\(locationService.location!.longitude)&dt=\(getCurrentDateString())")
        guard let unwrappedURL = url else { return }
        
        print("Weather Astronomy - URL: \(unwrappedURL.absoluteString)")
        
        do {
            // initialize URL session
            let (data, response) = try await URLSession.shared.data(from: unwrappedURL)
            
            // Check if valid response
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Weather Alert: Invalid Response")
                return
            }
            
            switch httpResponse.statusCode {
            case 200..<300:
                let decordedData = try JSONDecoder().decode(WeatherAstroDTO.self, from: data)
                weatherAstronomy = decordedData
                
                print("Weather Astronomy - Successfully Fetched Data")
            case 400..<500:
                print("Weather Astronomy - Invalid Request")
            default:
                print("Weather Alert - Error Decoading Data")
            }
            
        }
        catch {
            print("Weather Astronomy - Error Fetching Data: \(error.localizedDescription)")
        }
        
        
        
        
    }
    
    func getCurrentDateString() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: currentDate)
    }
    
    
    
}

