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

    @State var blinkingWarning: Color = .red
    
    //    @State var locationAvailable: Bool = false
    @State var isAlertActive: Bool = false
    @State var isContainCritical: Bool = false
    

    let utilities: Utilities = Utilities()
    @StateObject var constants: Constants = Constants()
    
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
                            .foregroundStyle(blinkingWarning)
                            .font(.system(size: 30))
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding()
                            .onAppear() {
                                startBlinking()
                            }
                        : nil

                        
                        Spacer()
                        
                        VStack{
                            VStack(spacing: 0) {
                                Image("\(utilities.getWeatherImage(code: weatherData?.current.condition.code ?? 1003))")
                                    .resizable()
                                    .frame(width: 300, height: 300)
                            

                                Text("\((constants.isCelecious) ? round(weatherData?.current.tempC ?? 0) : round(weatherData?.current.tempF ?? 0), specifier: "%.0f")\((constants.isCelecious) ? "°C" : "°F")")
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
                    .frame(height: UIScreen.main.bounds.height - utilities.safeAreaInsetsTotal(requestValue: 1))
                    
                    
                    VStack {
                        
                        
                        CustomHourlyForecast(hourWeather: $hourWeather, constants: constants)
                        
                        if(isAlertActive) {
                            CustomUIRectangleTile(
                                tileTitle: .constant("Alerts"),
                                height: nil,
                                color: .orange.opacity(0.1)
                            ) {
                                
                                if let verifiedWeatherAlertsData = weatherAlertsData, weatherAlertsData != nil {
                                    CustomTileAlerts(alertsList: .constant(verifiedWeatherAlertsData.alerts.alert))
                                }
                                
                            }
                        }
                        
                        CustomUIRectangleTile(tileTitle: .constant("Forcasting Days"), height: nil) {

                            ScrollView {
                                CustomDaysForecast(forecastDaysList: $forecastDaysList, constants: constants)
                            }
                            .frame(height: constants.uiRectangleWidth * 1.25)
                            .scrollIndicators(.hidden)
                        }

                        
                        HStack(spacing: 10) {
                                CustomTileWind(
                                    direction: .constant(weatherData?.current.windDir ?? "N/A"),
                                    speed: .constant(((constants.isSpeedKPH) ? weatherData?.current.windKph : weatherData?.current.windMph) ?? 0),
                                    windDegree: .constant(weatherData?.current.windDegree ?? 0),
                                    constants: constants
                                )
                            
                            
                                CustomTileHumidity(humidityLevel: .constant(weatherData?.current.humidity))
                            
                        }
                        
                        
                            CustomTileFeelsLike(
                                feelslike: .constant((constants.isCelecious) ? weatherData?.current.feelslikeC ?? 0 : weatherData?.current.feelslikeF ?? 0),
                                windchill: .constant((constants.isCelecious) ? weatherData?.current.windchillC ?? 0 : weatherData?.current.windchillF ?? 0),
                                heatindex: .constant((constants.isCelecious) ? weatherData?.current.heatindexC ?? 0 : weatherData?.current.heatindexF ?? 0))
                        
//                        
//                        feelslike: (constants.isCelecious) ? .constant(weatherData?.current.feelslikeC ?? 0) : .constant(weatherData?.current.feelslikeF ?? 0),
//                        windchill: (constants.isCelecious) ? .constant(weatherData?.current.windchillC ?? 0) : .constant(weatherData?.current.windchillF ?? 0),
//                        heatindex: (constants.isCelecious) ? .constant(weatherData?.current.heatindexC ?? 0) : .constant(weatherData?.current.heatindexF ?? 0)
                    
                        
                        
                        HStack(spacing: 10) {
                                CustomTilePrecipitation(
                                    precipitation: .constant((constants.isPrecipitationMM) ? weatherData?.current.precipMM : weatherData?.current.precipIn)
                                )
                            
                                CustomTilePressure(
                                    pressureMb: .constant(weatherData?.current.pressureMb ?? 0),
                                    pressureIn: .constant(weatherData?.current.pressureIn ?? 0),
                                    constants: constants
                                )
                        }
                        
                        
                        HStack(spacing: 10) {
                            CustomTileUV(
                                uvIndex: .constant(weatherData?.current.uv ?? 0)
                            )
                            
                            CustomTileVisibility(
                                visibilityKm: .constant(weatherData?.current.visKm ?? 0),
                                visibilityMi: .constant(weatherData?.current.visMi ?? 0)
                            )
                        }
                        
                        CustomTileMoon(
                            moonPhase: .constant(weatherAstronomyData?.astronomy.astro.moonPhase ?? "No Data"),
                            moonIllumination: .constant(weatherAstronomyData?.astronomy.astro.moonIllumination ?? 0),
                            moonrise: .constant(weatherAstronomyData?.astronomy.astro.moonrise ?? "No Data"),
                            moonset: .constant(weatherAstronomyData?.astronomy.astro.moonset ?? "No Data")
                        )
                        
                        
                        HStack(spacing: 10) {
                            CustomTileCloud(
                                cloudCover: .constant(weatherData?.current.cloud ?? 0)
                            )

                            CustomTileSunSetRise(
                                sunrise: .constant(weatherAstronomyData?.astronomy.astro.sunrise ?? "No Data"),
                                sunset: .constant(weatherAstronomyData?.astronomy.astro.sunset ?? "No Data")
                            )
                        }
                        
                        
                        CustomTileAir(airQuality: .constant(weatherData?.current.airQuality), constants: constants)

                        
                        
                        HStack(spacing: 10) {
                            Text("History Data")
                                .foregroundStyle(.secondary)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(15)
                                .padding(.leading, 10)
                            
                            NavigationLink {
                                SettingsPage(constants: constants)
                            } label: {
                                Image(systemName: "gear")
                                    .font(.title)
                                    .foregroundStyle(.secondary)
                                    .padding(15)
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(15)
                                    .padding(.trailing, 10)
                            }
                            .foregroundStyle(.secondary)
                            
                            
                        }

                        
                        
                    }
                    .padding(.top, utilities.safeAreaInsetsTotal(requestValue: 2) + 20)
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
                    
                    await CLWeatherAlertsViewModel(locationService: locationService, weatherAlertsData: $weatherAlertsData, isContainCritical: $isContainCritical).fetchWeatherAlerts()
                    
                    await CLWeatherAstronomyViewModel(locationService: locationService, weatherAstronomy: $weatherAstronomyData).fetchWeatherAstronomy()
                    
                    
                    hourWeather = forecastViewModel.getHourlyWeather(weatherForecastData: weatherForecastData)
                    forecastDaysList = forecastViewModel.getForecastDaysList(weatherForecastData: weatherForecastData)
                    
                    if (weatherAlertsData?.alerts.alert.count ?? 0 > 0) {
                        isAlertActive = true
                    }
                    
                    locationService.isLocationUpdated = false
                }
            }
        }
    }
    
    
    func startBlinking() {
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            withAnimation {
                if(isContainCritical) {
                    blinkingWarning = (blinkingWarning == .red) ? .gray.opacity(0.3) : .red
                } else {
                    blinkingWarning = (blinkingWarning == .orange) ? .gray.opacity(0.3) : .orange
                }
            }
        }
        
    }


    
}

#Preview {
    WeatherView()
}
