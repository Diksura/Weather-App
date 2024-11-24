//
//  HourlyWeatherManager.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-24.
//

import SwiftUI

struct HourlyWeatherManager {
    
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
    
}
