//
//  CustomTileWind.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-27.
//

import SwiftUI

struct CustomTileWind: View {
    var body: some View {
        CustomUISquarTile(tileTitle: .constant("Wind Details")) {
            VStack(alignment: .leading) {
                VStack(spacing: 0) {
                    
                    Text("23")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Text("km/h")
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }

                Text("NW")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .trailing)

            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue)
        }
    }
}

#Preview {
    CustomTileWind()
}
