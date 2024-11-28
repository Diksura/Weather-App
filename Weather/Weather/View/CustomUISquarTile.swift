//
//  CustomUISquarTile.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-24.
//

import SwiftUI

struct CustomUISquarTile<TileContent: View>: View {
    
    @Binding var tileTitle: String
    @ViewBuilder var tileContent: () -> TileContent

    var body: some View {
        VStack {
            Text("\(tileTitle)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 15)
//                .padding(.bottom, 15)
                .padding(.horizontal, 15)

            
//            Spacer()
            
            tileContent()
        }
        .frame(width: Constants().uiSquareSize, height: Constants().uiSquareSize)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(15)
    }
    
}

#Preview {
    CustomUISquarTile(tileTitle: .constant("Tile Title")) {
        Text("This is the tile content")
            .font(.headline)
            .foregroundColor(.blue)
    }
}

