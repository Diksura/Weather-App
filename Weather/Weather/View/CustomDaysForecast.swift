//
//  CustomDaysForecast.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-25.
//

import SwiftUI

struct CustomDaysForecast: View {
    @Binding var forecastDaysList: [ForecastFullDayDTO]?

    var body: some View {
        Group {
            if let forecastDaysList = forecastDaysList, !forecastDaysList.isEmpty {
                ForEach(forecastDaysList, id: \.id) { forecastDay in
                    ForecastDayRow(forecastDay: forecastDay)
                }
            } else {
                ForEach(0..<3, id: \.self) { _ in
                    ForecastDayRow(forecastDay: nil)
                }
            }
        }
    }
}

struct ForecastDayRow: View {
    var forecastDay: ForecastFullDayDTO?

    var body: some View {
        if let verfiesForecastDay = forecastDay, forecastDay != nil{
            HStack {
                VStack(alignment: .leading) {
                    Text("\(verfiesForecastDay.date)")
                        .foregroundStyle(.primary.opacity(0.4))
                        .font(.caption)
                        .padding(.bottom, 10)

                    Text("Temperature:")
                        .foregroundStyle(.primary.opacity(0.6))
                        .font(.subheadline)

                    HStack {
                        Text("Max: \(temperatureText(for: verfiesForecastDay.maxtempC, verfiesForecastDay.maxtempF))º")
                            .foregroundStyle(.primary.opacity(0.5))
                            .font(.system(size: 14))
                        Spacer()
                        Text("Min: \(temperatureText(for: verfiesForecastDay.mintempC, verfiesForecastDay.mintempF))")
                            .foregroundStyle(.primary.opacity(0.5))
                            .font(.system(size: 14))
                    }
                    .padding(.horizontal, 30)

                    Divider()

                    Text("Wind Speed: \(speedText(for: verfiesForecastDay.maxwindKph, verfiesForecastDay.maxwindMph))")
                        .foregroundStyle(.primary.opacity(0.6))
                        .font(.subheadline)
                        .padding(.top, 3)

                    Divider()

                    Text("Visibility: \(distanceText(for: verfiesForecastDay.avgvisKm, verfiesForecastDay.avgvisMiles))")
                        .foregroundStyle(.primary.opacity(0.6))
                        .font(.subheadline)
                }

                Spacer()

                VStack(spacing: 0) {
                    Image("\(Utilities().getWeatherImage(code: verfiesForecastDay.condition.code))")
                        .resizable()
                        .frame(width: 80, height: 80)

                    HStack {
                        Text("\(Int(verfiesForecastDay.dailyChanceOfRain))%")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)

                        Text("|")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.primary.opacity(0.1))

                        Text("\(Int(verfiesForecastDay.dailyChanceOfSnow))%")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundStyle(.gray)
                    }

                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(temperatureText(for: verfiesForecastDay.avgtempC, verfiesForecastDay.avgtempF))")
                            .font(.title)

                        Text(Constants().isCelecious ? "ºC" : "ºF")
                            .font(.caption)
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal, 10)
        }
    }

    private func temperatureText(for celsius: Double?, _ fahrenheit: Double?) -> String {
        if let celsius = celsius, let fahrenheit = fahrenheit {
            return String(format: "%.1f", Constants().isCelecious ? celsius : fahrenheit)
        }
        return "--"
    }

    private func speedText(for kph: Double?, _ mph: Double?) -> String {
        if let kph = kph, let mph = mph {
            return String(format: "%.1f \(Constants().isSpeedKPH ? "km/h" : "mi/h")", Constants().isSpeedKPH ? kph : mph)
        }
        return "--"
    }

    private func distanceText(for km: Double?, _ miles: Double?) -> String {
        if let km = km, let miles = miles {
            return String(format: "%.1f \(Constants().isDistanceKm ? "km" : "mi")", Constants().isDistanceKm ? km : miles)
        }
        return "--"
    }
}


struct CustomDaysForecast_Previews: PreviewProvider {
    static var previews: some View {
        let sampleForecastData: [ForecastFullDayDTO] = [
            ForecastFullDayDTO(
                id: UUID().uuidString,
                maxtempC: 28.5,
                maxtempF: 83.3,
                mintempC: 22.1,
                mintempF: 71.8,
                avgtempC: 15.0,
                avgtempF: 59.0,
                maxwindMph: 10.0,
                maxwindKph: 16.1,
                totalprecipMm: 1.0,
                totalprecipIn: 0.04,
                totalsnowCm: 0.0,
                avgvisKm: 10.0,
                avgvisMiles: 6.2,
                avghumidity: 70.0,
                dailyWillItRain: 1,
                dailyChanceOfRain: 40.0,
                dailyWillItSnow: 0,
                dailyChanceOfSnow: 0.0,
                condition: ConditionDTO(text: "Partly Cloudy", icon: "//cdn.weatherapi.com/weather/64x64/day/116.png", code: 1000),
                uv: 5.0,
                airQuality: AirQualityDTO(co: 2.3, no2: 1.2, o3: 19.0, so2: 0.4, pm2_5: 3.0, pm10: 5.0, usEpaIndex: 23.0, gbDefraIndex: 2.0)
            )
        ]

        return CustomDaysForecast(forecastDaysList: .constant(sampleForecastData))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

