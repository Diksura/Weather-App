//
//  Constants.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-20.
//

import SwiftUI

class Constants: ObservableObject {
    /// API Key
    static let apiKey = "838714aecdf04acaad8173636241811"
    
    /// Settings
    @Published  var isCelecious: Bool = true
    @Published  var isSpeedKPH: Bool = true
    @Published var isDistanceKm: Bool = true
    @Published var isLanguageEng: Bool = true
    @Published var isPrecipitationMM: Bool = true
    @Published var isAirUKDefra: Bool = true
    
    @Published var pressureUnitType: PressureUnits = PressureUnits.kPa
    @Published var languageType: Language = Language.English
    

    
    /// View Constrains
    let uiSquareSize: CGFloat = (CGFloat(UIScreen.main.bounds.width) - 60) / 2
    let uiRectangleWidth: CGFloat = (CGFloat(UIScreen.main.bounds.width) - 40)

    
}

enum Language: String, CaseIterable {
    case Arabic = "ar"
    case Bengali = "bn"
    case Bulgarian = "bg"
    case ChineseSimplified = "zh"
    case ChineseTraditional = "zh_tw"
    case Czech = "cs"
    case Danish = "da"
    case Dutch = "nl"
    case English = "en"
    case Finnish = "fi"
    case French = "fr"
    case German = "de"
    case Greek = "el"
    case Hindi = "hi"
    case Hungarian = "hu"
    case Italian = "it"
    case Japanese = "ja"
    case Havanese = "jv"
    case Jorean = "ko"
    case Mandarin = "zh_cmn"
    case Marathi = "mr"
    case Polish = "pl"
    case Portuguese = "pt"
    case Punjabi = "pa"
    case Romanian = "ro"
    case Russian = "ru"
    case Serbian = "sr"
    case Sinhala = "si"
    case Slovak = "sk"
    case Spanish = "es"
    case Swedish = "sv"
    case Tamil = "ta"
    case Telugu = "te"
    case Turkish = "tr"
    case Ukrainian = "uk"
    case Urdu = "ur"
    case Vietnamese = "vi"
    case WuShanghainese = "zh_wuu"
    case Xiang = "zh_hsn"
    case Cantonese = "zh_yue"
    case Zulu = "zu"

}

