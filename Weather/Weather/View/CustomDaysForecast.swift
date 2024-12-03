//
//  CustomDaysForecast.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-25.
//

import SwiftUI

struct CustomDaysForecast: View {
    @Binding var forecastDaysList: [ForecastFullDayDTO]?
    @ObservedObject var constants: Constants


    var body: some View {
        Group {
            if let forecastDaysList = forecastDaysList, !forecastDaysList.isEmpty {
                ForEach(forecastDaysList, id: \.id) { forecastDay in
                    ForecastDayRow(forecastDay: .constant(forecastDay), constants: constants)
                }
            } else {
                ForEach(0..<3, id: \.self) { _ in
                    ForecastDayRow(forecastDay: .constant(nil), constants: constants)
                }
            }
        }
    }
}

struct ForecastDayRow: View {
    @Binding var forecastDay: ForecastFullDayDTO?
    @ObservedObject var constants: Constants

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
                        Text("Min: \(temperatureText(for: verfiesForecastDay.mintempC, verfiesForecastDay.mintempF))º")
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

                        Text(constants.isCelecious ? "ºC" : "ºF")
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
            return String(format: "%.1f", constants.isCelecious ? celsius : fahrenheit)
        }
        return "--"
    }

    private func speedText(for kph: Double?, _ mph: Double?) -> String {
        if let kph = kph, let mph = mph {
            return String(format: "%.1f \(constants.isSpeedKPH ? "km/h" : "mi/h")", constants.isSpeedKPH ? kph : mph)
        }
        return "--"
    }

    private func distanceText(for km: Double?, _ miles: Double?) -> String {
        if let km = km, let miles = miles {
            return String(format: "%.1f \(constants.isDistanceKm ? "km" : "mi")", constants.isDistanceKm ? km : miles)
        }
        return "--"
    }
}


struct CustomDaysForecast_Previews: PreviewProvider {
    static var previews: some View {
        
        return CustomDaysForecast(forecastDaysList: .constant(kForecastFullDayDTO), constants: Constants())
            .previewLayout(.sizeThatFits)
            .padding()
        
    }
}

