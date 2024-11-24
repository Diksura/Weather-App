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
    
    //    @State var locationAvailable: Bool = false
    @State var isAlertActive: Bool = false
    
    /// Settings
    @State var isCelecious: Bool = true
    
    
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
                            

                                Text("\((isCelecious) ? weatherData?.current.tempC ?? 0 : weatherData?.current.tempF ?? 0, specifier: "%.0f")\((isCelecious) ? "°C" : "°F")")
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
                        
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack {
                                Text("Upcumming Hourly Weather")
                                    .frame(width: uiRectangleWidth, height: uiSquareSize/2)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(15)
                                
                                Text("Upcumming Hourly Weather")
                                    .frame(width: uiSquareSize/2, height: uiSquareSize/2)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(15)
                                
                                Text("Upcumming Hourly Weather")
                                    .frame(width: uiSquareSize/2, height: uiSquareSize/2)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(15)

                            }
                            .padding(.leading, 10)
                        }
                        
                        VStack(alignment: .leading) {
                            Text("Forcasting Days")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.top, 15)
//                                .padding(.bottom, 5)
                                .padding(.horizontal, 15)
                            
                            Divider()
                                .padding(.horizontal, 10)
                            
                            Spacer()
                        }
                        .frame(width: uiRectangleWidth, height: uiRectangleWidth)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)

                        

                        
                        HStack(spacing: 10) {
                            VStack{
                                Text("Wind Details")
                            }
                            .frame(width: uiSquareSize, height: uiSquareSize)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            
                            VStack{
                                Text("Humity Details")
                            }
                            .frame(width: uiSquareSize, height: uiSquareSize)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                        }
                        
                        VStack{
                            Text("Feels like, wind chill Details")
                        }
                        .frame(width: uiRectangleWidth)
                        .frame(minHeight: uiSquareSize)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)
                        
                        VStack{
                            Text("Precipitation Details")
                        }
                        .frame(width: uiRectangleWidth)
                        .frame(minHeight: uiSquareSize)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)
                        
                        
                        HStack(spacing: 10) {
                            VStack{
                                Text("UV Details")
                            }
                            .frame(width: uiSquareSize, height: uiSquareSize)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            
                            VStack{
                                Text("Pressure Details")
                            }
                            .frame(width: uiSquareSize, height: uiSquareSize)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                        
                        }
                        
                        
                        HStack(spacing: 10) {
                            VStack{
                                Text("cloud Details")
                            }
                            .frame(width: uiSquareSize, height: uiSquareSize)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                            
                            VStack{
                                Text("Air Quality Details")
                            }
                            .frame(width: uiSquareSize, height: uiSquareSize)
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(15)
                        }
                        
                        VStack {
                            Text("Moon Details")
                        }
                        .frame(width: uiRectangleWidth)
                        .frame(minHeight: uiSquareSize)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)


                        VStack {
                            Text("Air Details")
                        }
                        .frame(width: uiRectangleWidth)
                        .frame(minHeight: uiSquareSize)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(15)
                        
                        
                        
                        
                        
                        
                        
                        
                        Text("History Data > ")
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.trailing, 20)

                        
                        
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
                    await CLWeatherViewModel(locationService: locationService, weatherData: $weatherData).fetchWeatherData()
                    
                    await CLWeatherForecastViewModel(locationService: locationService, weatherForecastData: $weatherForecastData).fetchWeatherForecastData()
                    
                    await CLWeatherAlertsViewModel(locationService: locationService, weatherAlertsData: $weatherAlertsData).fetchWeatherAlerts()
                    
                    await CLWeatherAstronomyViewModel(locationService: locationService, weatherAstronomy: $weatherAstronomyData).fetchWeatherAstronomy()
                    
                    locationService.isLocationUpdated = false
                }
            }
        }
    }


    
}

#Preview {
    WeatherView()
}
