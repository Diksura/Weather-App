//
//  PreviewConstants.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-27.
//

import Foundation

let mockWeatherData = WeatherDTO(
    location: LocationDTO(
        name: "Mock City",
        region: "Mock Region",
        country: "Mock Country",
        lat: 0.0,
        lon: 0.0,
        tzID: "Mock/Timezone",
        localtimeEpoch: 0,
        localtime: "2024-11-26 12:00"
    ),
    current: CurrentDTO(
        lastUpdatedEpoch: 0,
        lastUpdated: "2024-11-26 12:00",
        tempC: 25.0,
        tempF: 77.0,
        isDay: 1,
        condition: ConditionDTO(
            text: "Sunny",
            icon: "",
            code: 1000
        ),
        windMph: 5.0,
        windKph: 8.0,
        windDegree: 90.0,
        windDir: "E",
        pressureMb: 1012.0,
        pressureIn: 29.88,
        precipMM: 0.0,
        precipIn: 0.0,
        humidity: 65.0,
        cloud: 0.0,
        feelslikeC: 25.0,
        feelslikeF: 77.0,
        windchillC: 25.0,
        windchillF: 77.0,
        heatindexC: 26.0,
        heatindexF: 78.8,
        dewpointC: 18.0,
        dewpointF: 64.4,
        visKm: 10.0,
        visMi: 6.2,
        uv: 5.0,
        gustMph: 10.0,
        gustKph: 16.0,
        airQuality: AirQualityDTO(
            co: 0.4,
            no2: 5.0,
            o3: 30.0,
            so2: 2.0,
            pm2_5: 10.0,
            pm10: 20.0,
            usEpaIndex: 1.0,
            gbDefraIndex: 1.0
        )
    )
)

