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
    @Binding var isContainCritical: Bool

    
    
    func fetchWeatherAlerts() async {
        
        guard let _ = locationService.location else {
            print("Weather Alert - Location not available")
            return
        }
        
        // Creating URl
        let url = URL(string: "\(Constants.BASE_URL)/alerts?latitude=\(locationService.location!.latitude)&longitude=\(locationService.location!.longitude)")
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
                weatherAlertsData = sortByServerity(decodedData: decodedData)
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
    
    func sortByServerity(decodedData: WeatherAlertsDTO) -> WeatherAlertsDTO {
        var newDecodedData = decodedData
        
        newDecodedData.alerts.alert = newDecodedData.alerts.alert.map { alert in
            
            var newAlert = alert
         
            switch alert.severity {
            case AlertSeverity.extreme.rawValue:
                newAlert.isCritical = AlertSeverity.extreme
                isContainCritical = true
            case AlertSeverity.moderate.rawValue:
                newAlert.isCritical = AlertSeverity.moderate
            case AlertSeverity.low.rawValue:
                newAlert.isCritical = AlertSeverity.low
            default:
                newAlert.isCritical = AlertSeverity.low
            }
            
            return newAlert
            
        }.sorted { lhs, rhs in
            
            let lhsPriority = alertPriority(for: lhs.isCritical)
            let rhsPriority = alertPriority(for: rhs.isCritical)
            return lhsPriority > rhsPriority
            
        }
        
        return newDecodedData
    }
    
    func alertPriority(for severity: AlertSeverity) -> Int {
        switch severity {
        case .extreme: return 3
        case .moderate: return 2
        case .low: return 1
        }
    }
    
    
}
