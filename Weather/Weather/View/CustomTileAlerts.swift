//
//  CustomTileAlerts.swift
//  Weather
//
//  Created by Pasan Diksura on 2024-11-29.
//

import SwiftUI

struct CustomTileAlerts: View {
    
    @Binding var isContainCritical: Bool
    @Binding var alertsList: [AlertDTO]
    let utilities: Utilities = Utilities()

    
    var body: some View {
        
        ForEach(alertsList, id: \.id) { alert in
            
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
    let alert = [AlertDTO(
        headline: "Flood Warning issued January 05 at 9:47PM EST until January 07 at 6:15AM EST by NWS",
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
    )]
    
    return CustomTileAlerts(isContainCritical: .constant(false), alertsList: .constant(alert))
}
