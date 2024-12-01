//
//  CustomTileAlerts.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-29.
//

import SwiftUI

struct CustomTileAlerts: View {
    
    @Binding var alertsList: [AlertDTO]
    let utilities: Utilities = Utilities()

    
    var body: some View {
        
        ForEach(alertsList, id: \.id) { alert in
            
            let isContainCritical = (alert.isCritical == AlertSeverity.extreme) ? true : false
            
            HStack {
                
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .top, spacing: 0) {
                        
                        Text("Headline")
                            .frame(width: 65, alignment: .leading)
                        
                        Text(": ")
                        
                        Text("\(alert.headline)")

                    }
                    
                    Divider()
                        .padding(.horizontal, 8)
                    
                    HStack(alignment: .top, spacing: 0) {

                        Text("Event")
                            .frame(width: 70, alignment: .leading)
                        
                        Text(": ")

                        Text("\(alert.event)")

                    }                    
                    
                    Divider()
                        .padding(.horizontal, 8)
                    
                    HStack(alignment: .top, spacing: 0) {

                        Text("Areas")
                            .frame(width: 70, alignment: .leading)

                        Text(": ")

                        Text("\(alert.areas)")

                    }                    
                    
                    Divider()
                        .padding(.horizontal, 8)
                    
                    HStack(alignment: .top, spacing: 0) {

                        Text("Urgency")
                            .frame(width: 70, alignment: .leading)

                        Text(": ")

                        Text("\(alert.urgency)")

                    }
                    
                    Divider()
                        .padding(.horizontal, 8)
                    
                    HStack(alignment: .top, spacing: 0) {

                        Text("Effective")
                            .frame(width: 70, alignment: .leading)

                        Text(": ")

                        Text("\(utilities.formatDateWithDataTimeUTC(inputDateString: alert.effective))")


                    }                    
                    
                    Divider()
                        .padding(.horizontal, 8)
                    
                    HStack(alignment: .top, spacing: 0) {

                        Text("Expires")
                            .frame(width: 70, alignment: .leading)

                        Text(": ")

                        Text("\(utilities.formatDateWithDataTimeUTC(inputDateString: alert.expires))")

                    }                    
                    
                    
                }
                .padding(.vertical, 10)
                .font(.subheadline)
                .foregroundStyle(.black.opacity(0.6))
                
                Spacer()
                
                VStack {
                    Image(systemName: "\(isContainCritical ? "exclamationmark.triangle.fill" :"exclamationmark.triangle")")
                        .font(.system(size: 48))
                        .foregroundStyle(isContainCritical ? .red : .yellow)
                    
                    Text(alert.severity)
                        .font(.footnote)
                        .foregroundStyle(isContainCritical ? Color.red.opacity(0.7) : Color.orange.opacity(0.7))
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(isContainCritical ? Color.red.opacity(0.13) : Color.yellow.opacity(0.13))
            .cornerRadius(10)
            .padding(10)
        
        }
        
    }
}

#Preview {
    let alert = kAlertDTO
    return CustomTileAlerts(alertsList: .constant(alert))
}
