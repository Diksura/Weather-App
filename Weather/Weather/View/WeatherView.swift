//
//  ContentView.swift
//  Weather App
//
//  Created by Pasan Diksura on 2024-11-18.
//

import SwiftUI

struct WeatherView: View {
    
    /// System
    @StateObject private var locationService = CurrentLocation()

    @State var weatherData: WeatherDTO?
    @State var weatherForecastData: WeatherForecastDTO?
    @State var weatherAlertsData: WeatherAlertsDTO?
    @State var weatherAstronomyData: WeatherAstroDTO?
    
    /// Make these variables mutable so if the valu 'nil' it'll show loading view while loading
    @State var hourWeather: [ForecastHourDTO]?
    @State var forecastDaysList: [ForecastFullDayDTO]?

    
    //    @State var locationAvailable: Bool = false
    @State var isAlertActive: Bool = false
    

    
    
    /// View Constrains
    let uiSquareSize: CGFloat = (CGFloat(UIScreen.main.bounds.width) - 60) / 2
    let uiRectangleWidth: CGFloat = (CGFloat(UIScreen.main.bounds.width) - 40)


    var body: some View {
        
        NavigationStack {
            
            if let _ = locationService.location {
                ScrollView {
                    VStack {
                        (isAlertActive) ?
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundStyle(Color.red)
                            .font(.system(size: 30))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                        : nil

                        
                        Spacer()
                        
                        VStack{
                            VStack(spacing: 0) {
                                Image("Cloudy-Sunny")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                            

                                Text("\((Constants().isCelecious) ? weatherData?.current.tempC ?? 0 : weatherData?.current.tempF ?? 0, specifier: "%.0f")\((Constants().isCelecious) ? "°C" : "°F")")
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
                    .frame(height: UIScreen.main.bounds.height - Utilities().safeAreaInsetsTotal(requestValue: 1))
                    
                    
                    VStack {
                        
                        
                        CustomHourlyForecast(hourWeather: $hourWeather)
                        
                        
                        CustomUIRectangleTile(tileTitle: .constant("Forcasting Days"), height: nil) {

                            ScrollView {
                                    CustomDaysForecast(forecastDaysList: $forecastDaysList)
                            }
                            .frame(height: Constants().uiRectangleWidth * 1.25)
                            .scrollIndicators(.hidden)
                        }

                        
                        HStack(spacing: 10) {
                            CustomUISquarTile(tileTitle: .constant("Wind Details")) {
                                Text("")
                            }
                            
                            CustomUISquarTile(tileTitle: .constant("Humidity Details")) {
                                Text("")
                            }
                            
                        }
                        
                        
                        CustomUIRectangleTile(tileTitle: .constant("Feels like, wind chill Details"), height: nil) {
                            // TODO
                        }
                        
                        CustomUIRectangleTile(tileTitle: .constant("Precipitation Details"), height: nil) {
                            // TODO
                        }
                    
                        
                        
                        HStack(spacing: 10) {
                            CustomUISquarTile(tileTitle: .constant("UV Details")) {
                                Text("")
                            }
                            
                            CustomUISquarTile(tileTitle: .constant("Pressure Details")) {
                                Text("")
                            }
                        }
                        
                        
                        HStack(spacing: 10) {
                            CustomUISquarTile(tileTitle: .constant("Cloud Details")) {
                                Text("")
                            }

                            CustomUISquarTile(tileTitle: .constant("Air Quality Details")) {
                                Text("")
                            }
                        }
                        
                        CustomUIRectangleTile(tileTitle: .constant("Moon Details"), height: nil) {
                            // TODO
                        }
                        
                        CustomUIRectangleTile(tileTitle: .constant("Air Details"), height: nil) {
                            // TODO
                        }

                        
                        
                        Text("History Data")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 20)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            .padding(.horizontal, 10)

                        
                        
                    }
                    .padding(.top, Utilities().safeAreaInsetsTotal(requestValue: 2) + 20)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 10)
                    
                    
                }
                .scrollIndicators(.hidden)

            
            } else {
                Text("Fetching location...")
            }
            
        }
        .onAppear {
            locationService.requestAuthorization()
        }
        .onChange(of: locationService.isLocationUpdated) {
            if (locationService.isLocationUpdated) {
                Task {
                    
                    let forecastViewModel = CLWeatherForecastViewModel(locationService: locationService, weatherForecastData: $weatherForecastData)
                    
                    
                    await CLWeatherViewModel(locationService: locationService, weatherData: $weatherData).fetchWeatherData()
                    
                    await forecastViewModel.fetchWeatherForecastData()
                    
                    await CLWeatherAlertsViewModel(locationService: locationService, weatherAlertsData: $weatherAlertsData).fetchWeatherAlerts()
                    
                    await CLWeatherAstronomyViewModel(locationService: locationService, weatherAstronomy: $weatherAstronomyData).fetchWeatherAstronomy()
                    
                    
                    hourWeather = forecastViewModel.getHourlyWeather(weatherForecastData: weatherForecastData)
                    forecastDaysList = forecastViewModel.getForecastDaysList(weatherForecastData: weatherForecastData)
                    
                    locationService.isLocationUpdated = false
                }
            }
        }
    }
    
    func getForecastDaysList(weatherForecastData: WeatherForecastDTO?) -> [ForecastFullDayDTO] {
        
        var forecastDaysList: [ForecastFullDayDTO] = []
        
        guard let verifiedWeatherForecastData = weatherForecastData?.forecast else {
            print("getForecastDaysList() - No weather forecast data")
            return []
        }
        
        for forecastday in verifiedWeatherForecastData.forecastday {
            forecastDaysList.append(forecastday.fullDay)
        }
        
        return forecastDaysList
        
    }


    
}

#Preview {
    WeatherView()
}
