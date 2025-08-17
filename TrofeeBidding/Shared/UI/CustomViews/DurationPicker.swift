//
//  DurationPicker.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 16/08/2025.
//

import SwiftUI

struct DurationPicker: View {
    
    @State private var hours: Int = 0
    @State private var minutes: Int = 0
    @State private var seconds: Int = 0
    
    @Binding var auctionDurationInSeconds: Int
    
    var totalDurationInSeconds: Int {
        hours * 3600 + minutes * 60 + seconds
    }
    
    var body: some View {
        VStack(spacing: 10) {
            CustomText(font: .headline, text: "Auction Duration: \(hours)h \(minutes)m \(seconds)s")
            HStack {
                Picker("Hours", selection: $hours) {
                    ForEach(0..<24) { Text("\($0) h") }
                }
                .frame(width: 100)
                .clipped()
                
                Picker("Minutes", selection: $minutes) {
                    ForEach(0..<60) { Text("\($0) m") }
                }
                .frame(width: 100)
                .clipped()
                
                Picker("Seconds", selection: $seconds) {
                    ForEach(0..<60) { Text("\($0) s") }
                }
                .frame(width: 100)
                .clipped()
            }
            .pickerStyle(.wheel)
            .onChange(of: hours, { _, _ in
                updateBinding()
            })
            .onChange(of: minutes, { _, _ in
                updateBinding()
            })
            .onChange(of: seconds, { _, _ in
                updateBinding()
            })
        }
        .padding()
    }
    
    private func updateBinding() {
        auctionDurationInSeconds = totalDurationInSeconds
    }
}

#Preview {
    DurationPicker(auctionDurationInSeconds: .constant(10))
}
