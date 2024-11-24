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
                                
                                ForEach(0..<12) { index in
                                    uiHourWeather(hour: "5AM", image: "Cloudy", precipitation: "50%", temperature: "23*")
                                }

                            }
                        }
                        .padding(10)
                        
                        
                        uiRectangleTile(tileTitle: "Forcasting Days", height: uiRectangleWidth) {
                            // TODO
                        }

                        
                        HStack(spacing: 10) {
                            uiSquarTile(tileTitle: "Wind Details") {
                                Text("")
                            }
                            
                            uiSquarTile(tileTitle: "Humidity Details") {
                                Text("")
                            }
                            
                        }
                        
                        
                        uiRectangleTile(tileTitle: "Feels like, wind chill Details", height: nil) {
                            // TODO
                        }
                        
                        uiRectangleTile(tileTitle: "Precipitation Details", height: nil) {
                            // TODO
                        }
                    
                        
                        
                        HStack(spacing: 10) {
                            uiSquarTile(tileTitle: "UV Details") {
                                Text("")
                            }
                            
                            uiSquarTile(tileTitle: "Pressure Details") {
                                Text("")
                            }
                        }
                        
                        
                        HStack(spacing: 10) {
                            uiSquarTile(tileTitle: "Cloud Details") {
                                Text("")
                            }

                            uiSquarTile(tileTitle: "Air Quality Details") {
                                Text("")
                            }
                        }
                        
                        uiRectangleTile(tileTitle: "Moon Details", height: nil) {
                            // TODO
                        }
                        
                        uiRectangleTile(tileTitle: "Air Details", height: nil) {
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
                    await CLWeatherViewModel(locationService: locationService, weatherData: $weatherData).fetchWeatherData()
                    
                    await CLWeatherForecastViewModel(locationService: locationService, weatherForecastData: $weatherForecastData).fetchWeatherForecastData()
                    
                    await CLWeatherAlertsViewModel(locationService: locationService, weatherAlertsData: $weatherAlertsData).fetchWeatherAlerts()
                    
                    await CLWeatherAstronomyViewModel(locationService: locationService, weatherAstronomy: $weatherAstronomyData).fetchWeatherAstronomy()
                    
                    locationService.isLocationUpdated = false
                }
            }
        }
    }
    
    
    
    func uiHourWeather(hour: String, image: String, precipitation: String, temperature: String) -> some View {
        
        return VStack(spacing: 0) {
            Text(hour)
                .font(.caption)
                .foregroundStyle(.primary.opacity(0.7))
            
            Image(image)
                .resizable()
                .frame(width: uiSquareSize/5, height: uiSquareSize/5)
            
            Text(precipitation)
                .font(.system(size: 9))
                .fontWeight(.bold)
                .foregroundStyle(.primary.opacity(0.7))
            
            Text(temperature)
                .font(.subheadline)
                .foregroundStyle(.primary.opacity(0.7))
            
        }
        .frame(height: uiSquareSize/1.8)
        .padding(.horizontal, 20)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        
    }
    
    
    func uiSquarTile<TileContent: View>(tileTitle: String, @ViewBuilder tileContent: () -> TileContent) -> some View {
        
        return VStack {
            Text("\(tileTitle)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 15)
                .padding(.bottom, 15)
                .padding(.horizontal, 15)

            
            Spacer()
            
            tileContent()
        }
        .frame(width: uiSquareSize, height: uiSquareSize)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }

    func uiRectangleTile<TileContent: View>(tileTitle: String, height: CGFloat?, @ViewBuilder tileContent: () -> TileContent) -> some View {
        
        return VStack(alignment: .leading) {
            Text("\(tileTitle)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 15)
//                .padding(.bottom, 5)
                .padding(.horizontal, 15)
            
            Divider()
                .padding(.horizontal, 10)
            
            Spacer()
            
            tileContent()
        }
        .frame(width: uiRectangleWidth, height: height)
        .frame(minHeight: uiSquareSize)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
        
    }

    
}

#Preview {
    WeatherView()
}
