//
//  CustomUIRectangleTile.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-24.
//

import SwiftUI

struct CustomUIRectangleTile<TileContent: View>: View {
    
    @Binding var tileTitle: String
    var height: CGFloat?
    var color: Color = .gray.opacity(0.1)
    
    @ViewBuilder var tileContent: () -> TileContent
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(tileTitle)")
                .font(.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 15)
    //                .padding(.bottom, 5)
                .padding(.horizontal, 15)
            
            Divider()
                .padding(.horizontal, 10)
                        
            tileContent()
                .padding(.bottom, 10)
        }
        .frame(width: Constants().uiRectangleWidth, height: height)
        .frame(minHeight: Constants().uiSquareSize)
        .background(color)
        .cornerRadius(15)
    }
    
}

#Preview {
    CustomUIRectangleTile(tileTitle: .constant("Tile Title"), height: Constants().uiRectangleWidth) {
        Text("This is the tile content")
            .font(.headline)
            .foregroundColor(.blue)
    }
}
