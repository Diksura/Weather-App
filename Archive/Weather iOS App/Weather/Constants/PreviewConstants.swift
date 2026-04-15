//
//  PreviewConstants.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-27.
//

import Foundation

let kLocationDTO = LocationDTO(
    name: "Toronto",
    region: "Ontario",
    country: "Canada",
    lat: 43.65107,
    lon: -79.347015,
    tzID: "America/Toronto",
    localtimeEpoch: 1633058400,
    localtime: "2024-11-30 10:00 AM"
)

let kMockWeatherDTO = WeatherDTO(
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

let kAlertDTO = [
    AlertDTO(
        headline: "Moderate",
        msgtype: "Alert",
        severity: "Moderate",
        urgency: "Expected",
        areas: "Calhoun; Lexington; Richland",
        category: "Met",
        certainty: "Likely",
        event: "Flood Warning",
        note: "Alert for Calhoun; Lexington; Richland (South Carolina) Issued by the National Weather Service",
        effective: "2021-01-05T21:47:00-05:00",
        expires: "2021-01-07T06:15:00-05:00",
        description: """
    ...The Flood Warning continues for the following rivers in South\nCarolina...\nCongaree River At Carolina Eastman affecting Richland, Calhoun\nand Lexington Counties.\nCongaree River At Congaree National Park-Gadsden affecting\nCalhoun and Richland Counties.\nNorth Fork Edisto River At Orangeburg affecting Orangeburg County.\n...The Flood Warning is now in effect until Thursday morning...\nThe Flood Warning continues for\nthe Congaree River At Carolina Eastman.\n* Until Thursday morning.\n* At 9:28 PM EST Tuesday the stage was 115.6 feet.\n* Flood stage is 115.0 feet.\n* Minor flooding is occurring and minor flooding is forecast.\n* Recent Activity...The maximum river stage in the 24 hours ending\nat 9:28 PM EST Tuesday was 118.2 feet.\n* Forecast...The river will rise to 115.7 feet just after midnight\ntonight. It will then fall below flood stage tomorrow morning to\n114.2 feet and begin rising again tomorrow evening. It will rise\nto 114.3 feet early Thursday morning. It will then fall again and\nremain below flood stage.\n* Impact...At 115.0 feet, Flooding occurs in low lying areas of the\nCarolina Eastman Facility and at the Congaree National Park.\n* Flood History...This crest compares to a previous crest of 116.3\nfeet on 12/03/2020.\n&&
    """,
        instruction: """
    A Flood Warning means that flooding is imminent or occurring. All\ninterested parties should take necessary precautions immediately.\nMotorists should not attempt to drive around barricades or drive\ncars through flooded areas.\nCaution is urged when walking near riverbanks.\nAdditional information is available at www.weather.gov.\nThe next statement will be issued Wednesday morning at 1000 AM EST.
    """
    ),
    AlertDTO(
        headline: "Extreme",
        msgtype: "Alert",
        severity: "Extreme",
        urgency: "Expected",
        areas: "Calhoun; Lexington; Richland",
        category: "Met",
        certainty: "Likely",
        event: "Flood Warning",
        note: "Alert for Calhoun; Lexington; Richland (South Carolina) Issued by the National Weather Service",
        effective: "2021-01-05T21:47:00-05:00",
        expires: "2021-01-07T06:15:00-05:00",
        description: """
    ...The Flood Warning continues for the following rivers in South\nCarolina...\nCongaree River At Carolina Eastman affecting Richland, Calhoun\nand Lexington Counties.\nCongaree River At Congaree National Park-Gadsden affecting\nCalhoun and Richland Counties.\nNorth Fork Edisto River At Orangeburg affecting Orangeburg County.\n...The Flood Warning is now in effect until Thursday morning...\nThe Flood Warning continues for\nthe Congaree River At Carolina Eastman.\n* Until Thursday morning.\n* At 9:28 PM EST Tuesday the stage was 115.6 feet.\n* Flood stage is 115.0 feet.\n* Minor flooding is occurring and minor flooding is forecast.\n* Recent Activity...The maximum river stage in the 24 hours ending\nat 9:28 PM EST Tuesday was 118.2 feet.\n* Forecast...The river will rise to 115.7 feet just after midnight\ntonight. It will then fall below flood stage tomorrow morning to\n114.2 feet and begin rising again tomorrow evening. It will rise\nto 114.3 feet early Thursday morning. It will then fall again and\nremain below flood stage.\n* Impact...At 115.0 feet, Flooding occurs in low lying areas of the\nCarolina Eastman Facility and at the Congaree National Park.\n* Flood History...This crest compares to a previous crest of 116.3\nfeet on 12/03/2020.\n&&
    """,
        instruction: """
    A Flood Warning means that flooding is imminent or occurring. All\ninterested parties should take necessary precautions immediately.\nMotorists should not attempt to drive around barricades or drive\ncars through flooded areas.\nCaution is urged when walking near riverbanks.\nAdditional information is available at www.weather.gov.\nThe next statement will be issued Wednesday morning at 1000 AM EST.
    """
    ),
    AlertDTO(
        headline: "Low",
        msgtype: "Alert",
        severity: "Low",
        urgency: "Expected",
        areas: "Calhoun; Lexington; Richland",
        category: "Met",
        certainty: "Likely",
        event: "Flood Warning",
        note: "Alert for Calhoun; Lexington; Richland (South Carolina) Issued by the National Weather Service",
        effective: "2021-01-05T21:47:00-05:00",
        expires: "2021-01-07T06:15:00-05:00",
        description: """
    ...The Flood Warning continues for the following rivers in South\nCarolina...\nCongaree River At Carolina Eastman affecting Richland, Calhoun\nand Lexington Counties.\nCongaree River At Congaree National Park-Gadsden affecting\nCalhoun and Richland Counties.\nNorth Fork Edisto River At Orangeburg affecting Orangeburg County.\n...The Flood Warning is now in effect until Thursday morning...\nThe Flood Warning continues for\nthe Congaree River At Carolina Eastman.\n* Until Thursday morning.\n* At 9:28 PM EST Tuesday the stage was 115.6 feet.\n* Flood stage is 115.0 feet.\n* Minor flooding is occurring and minor flooding is forecast.\n* Recent Activity...The maximum river stage in the 24 hours ending\nat 9:28 PM EST Tuesday was 118.2 feet.\n* Forecast...The river will rise to 115.7 feet just after midnight\ntonight. It will then fall below flood stage tomorrow morning to\n114.2 feet and begin rising again tomorrow evening. It will rise\nto 114.3 feet early Thursday morning. It will then fall again and\nremain below flood stage.\n* Impact...At 115.0 feet, Flooding occurs in low lying areas of the\nCarolina Eastman Facility and at the Congaree National Park.\n* Flood History...This crest compares to a previous crest of 116.3\nfeet on 12/03/2020.\n&&
    """,
        instruction: """
    A Flood Warning means that flooding is imminent or occurring. All\ninterested parties should take necessary precautions immediately.\nMotorists should not attempt to drive around barricades or drive\ncars through flooded areas.\nCaution is urged when walking near riverbanks.\nAdditional information is available at www.weather.gov.\nThe next statement will be issued Wednesday morning at 1000 AM EST.
    """
    ),
    AlertDTO(
        headline: "Extreme",
        msgtype: "Alert",
        severity: "Extreme",
        urgency: "Expected",
        areas: "Calhoun; Lexington; Richland",
        category: "Met",
        certainty: "Likely",
        event: "Flood Warning",
        note: "Alert for Calhoun; Lexington; Richland (South Carolina) Issued by the National Weather Service",
        effective: "2021-01-05T21:47:00-05:00",
        expires: "2021-01-07T06:15:00-05:00",
        description: """
    ...The Flood Warning continues for the following rivers in South\nCarolina...\nCongaree River At Carolina Eastman affecting Richland, Calhoun\nand Lexington Counties.\nCongaree River At Congaree National Park-Gadsden affecting\nCalhoun and Richland Counties.\nNorth Fork Edisto River At Orangeburg affecting Orangeburg County.\n...The Flood Warning is now in effect until Thursday morning...\nThe Flood Warning continues for\nthe Congaree River At Carolina Eastman.\n* Until Thursday morning.\n* At 9:28 PM EST Tuesday the stage was 115.6 feet.\n* Flood stage is 115.0 feet.\n* Minor flooding is occurring and minor flooding is forecast.\n* Recent Activity...The maximum river stage in the 24 hours ending\nat 9:28 PM EST Tuesday was 118.2 feet.\n* Forecast...The river will rise to 115.7 feet just after midnight\ntonight. It will then fall below flood stage tomorrow morning to\n114.2 feet and begin rising again tomorrow evening. It will rise\nto 114.3 feet early Thursday morning. It will then fall again and\nremain below flood stage.\n* Impact...At 115.0 feet, Flooding occurs in low lying areas of the\nCarolina Eastman Facility and at the Congaree National Park.\n* Flood History...This crest compares to a previous crest of 116.3\nfeet on 12/03/2020.\n&&
    """,
        instruction: """
    A Flood Warning means that flooding is imminent or occurring. All\ninterested parties should take necessary precautions immediately.\nMotorists should not attempt to drive around barricades or drive\ncars through flooded areas.\nCaution is urged when walking near riverbanks.\nAdditional information is available at www.weather.gov.\nThe next statement will be issued Wednesday morning at 1000 AM EST.
    """
    )
]

let kWeatherAlertsDTO = WeatherAlertsDTO(location: kLocationDTO, alerts: AlertsDTO(alert: kAlertDTO))
