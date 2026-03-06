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
        let url = URL(string: "\(Constants.BASE_URL)/forecast?latitude=\(locationService.location!.latitude)&longitude=\(locationService.location!.longitude)&days=3&aqi=yes&alerts=yes")
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
    
    func getHourlyWeather(weatherForecastData: WeatherForecastDTO?) -> [ForecastHourDTO] {
        var hourlyWeather: [ForecastHourDTO] = []
        
        let currentDate = Utilities().getCurrentDateString()
        let nextDate = Utilities().getNextDateString()
        let currentHour = Int(Utilities().getCurrentHourString()) ?? 0
        
        
        guard let forecast = weatherForecastData else {
            print("getHourlyWeather() --> No forecast data available")
            return hourlyWeather
        }
        
        if let currentDay: ForecastDayDTO = forecast.forecast.forecastday.first(where: { $0.date == currentDate }) {
            
            if currentHour < currentDay.hourly.count {
                hourlyWeather.append(contentsOf: currentDay.hourly[(currentHour + 1)...])
            } else {
                print("getHourlyWeather() --> Current hour exceeds available hourly data")
            }
            
        } else {
            print("getHourlyWeather() --> No matching day found for the current date")
        }
        
        
        if forecast.forecast.forecastday.count > 1 {
            let nextDateForecast = forecast.forecast.forecastday[1]
            
            if nextDateForecast.date == nextDate {
                if currentHour < nextDateForecast.hourly.count {
                    hourlyWeather.append(contentsOf: nextDateForecast.hourly[...(currentHour)])
                } else {
                    print("getHourlyWeather() --> Current hour exceeds available hourly data")
                }
            } else {
                print("getHourlyWeather() --> Second day's date does not match the current date")
                print("nextDateForecast.date = \(nextDateForecast.date)")
                print("nextDate = \(nextDate)")
            }
        } else {
            print("getHourlyWeather() --> No second day in forecast")
        }
        
//        for hour in hourlyWeather {
//            print("Hour: \(hour.time) --> \(hour.tempC)")
//        }

        return hourlyWeather
    }
    
    
    func getForecastDaysList(weatherForecastData: WeatherForecastDTO?) -> [ForecastFullDayDTO] {
        
        var forecastDaysList: [ForecastFullDayDTO] = []
        
        guard let verifiedWeatherForecastData = weatherForecastData?.forecast else {
            print("getForecastDaysList() - No weather forecast data")
            return []
        }
        
        for forecastday in verifiedWeatherForecastData.forecastday {
            var updatedFullDay = forecastday.fullDay
            updatedFullDay.date = Utilities().formatDateString(inputDateString: forecastday.date)
            forecastDaysList.append(updatedFullDay)
        }
        
        return forecastDaysList
        
    }

}
