//
//  Constants.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-20.
//

import SwiftUI

class Constants {
    /// API Key
    static let BASE_URL = "http://localhost:5031/api/weather"
    
    /// Settings
    @State var isCelecious: Bool = true
    @State var isSpeedKPH: Bool = true
    @State var isDistanceKm: Bool = true
    @State var isLanguageEng: Bool = true
    @State var isPrecipitationMM: Bool = true
    @State var isAirUKDefra: Bool = true
    
    
    @State var pressureUnitType: PressureUnits = PressureUnits.kPa
    
    var language: [Language] = [
        Language(language: "Arabic", languageCode: "ar"),
        Language(language: "Bengali", languageCode: "bn"),
        Language(language: "Bulgarian", languageCode: "bg"),
        Language(language: "Chinese Simplified", languageCode: "zh"),
        Language(language: "Chinese Traditional", languageCode: "zh_tw"),
        Language(language: "Czech", languageCode: "cs"),
        Language(language: "Danish", languageCode: "da"),
        Language(language: "Dutch", languageCode: "nl"),
        Language(language: "Finnish", languageCode: "fi"),
        Language(language: "French", languageCode: "fr"),
        Language(language: "German", languageCode: "de"),
        Language(language: "Greek", languageCode: "el"),
        Language(language: "Hindi", languageCode: "hi"),
        Language(language: "Hungarian", languageCode: "hu"),
        Language(language: "Italian", languageCode: "it"),
        Language(language: "Japanese", languageCode: "ja"),
        Language(language: "Javanese", languageCode: "jv"),
        Language(language: "Korean", languageCode: "ko"),
        Language(language: "Mandarin", languageCode: "zh_cmn"),
        Language(language: "Marathi", languageCode: "mr"),
        Language(language: "Polish", languageCode: "pl"),
        Language(language: "Portuguese", languageCode: "pt"),
        Language(language: "Punjabi", languageCode: "pa"),
        Language(language: "Romanian", languageCode: "ro"),
        Language(language: "Russian", languageCode: "ru"),
        Language(language: "Serbian", languageCode: "sr"),
        Language(language: "Sinhalese", languageCode: "si"),
        Language(language: "Slovak", languageCode: "sk"),
        Language(language: "Spanish", languageCode: "es"),
        Language(language: "Swedish", languageCode: "sv"),
        Language(language: "Tamil", languageCode: "ta"),
        Language(language: "Telugu", languageCode: "te"),
        Language(language: "Turkish", languageCode: "tr"),
        Language(language: "Ukrainian", languageCode: "uk"),
        Language(language: "Urdu", languageCode: "ur"),
        Language(language: "Vietnamese", languageCode: "vi"),
        Language(language: "Wu (Shanghainese)", languageCode: "zh_wuu"),
        Language(language: "Xiang", languageCode: "zh_hsn"),
        Language(language: "Yue (Cantonese)", languageCode: "zh_yue"),
        Language(language: "Zulu", languageCode: "zu")
    ]

    
    /// View Constrains
    let uiSquareSize: CGFloat = (CGFloat(UIScreen.main.bounds.width) - 60) / 2
    let uiRectangleWidth: CGFloat = (CGFloat(UIScreen.main.bounds.width) - 40)

    
}

