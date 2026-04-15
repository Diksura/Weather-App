//
//  CustomTileCloud.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-28.
//

import SwiftUI

struct CustomTileCloud: View {
    
    @Binding var cloudCover: Double
    
    
    var body: some View {
        CustomUISquarTile(tileTitle: .constant("Cloud Cover")) {
            
            VStack(alignment: .leading) {
                
                Spacer()
                
                HStack {
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0){
                        Text("\(Int(round(cloudCover)))")
                            .font(.system(size: 52))
                        
                        Text("%")
                            .font(.title2)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "cloud.fill")
                        .font(.system(size: 32))
                        .frame(maxHeight: .infinity, alignment: .topTrailing)
                        .foregroundStyle(Color.blue.opacity(0.3))
                        
                }
                .foregroundStyle(Color.black.opacity(0.6))
                
                Text(cloudCoverMessage(percentage: cloudCover))
                    .font(.caption)
                    .padding(.bottom, 10)
                    .foregroundStyle(Color.gray)
                
                
            }
            .padding(.horizontal, 15)
            
        }
    }
    
    func cloudCoverMessage(percentage: Double) -> String {
        switch percentage {
        case 0:
            return "Clear skies ahead. Enjoy the sunshine!"
        case 1..<20:
            return "Mostly clear skies with a few clouds."
        case 20..<50:
            return "Partly cloudy skies, but still plenty of sun."
        case 50..<80:
            return "Cloudy skies with occasional breaks of sunshine."
        case 80..<100:
            return "Mostly overcast skies. Sunshine will be limited."
        case 100:
            return "Completely overcast skies. No sun expected today."
        default:
            return "Cloud cover data is unavailable. Check local forecasts for updates."
        }
    }

}

#Preview {
    CustomTileCloud(cloudCover: .constant(67.7))
}
