//
//  AuctionTimeView.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct AuctionTimeView: View {
    
    let timeRemaining: (hours: Int, minutes: Int, seconds: Int)
    
    var body: some View {
        VStack(alignment:.leading) {
            CustomText(font: .system(size: 16, weight: .bold, design: .default), text: "Auction Time")
            HStack {
                TimeSlotLabel(text: timeRemaining.hours.description,subTitle: "Hours")
                TimeSlotLabel(text: timeRemaining.minutes.description,subTitle: "Minutes")
                TimeSlotLabel(text: timeRemaining.seconds.description,subTitle: "Seconds")
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    AuctionTimeView(timeRemaining: (hours: 1, minutes: 2, seconds: 3))
}
