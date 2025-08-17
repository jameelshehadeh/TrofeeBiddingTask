//
//  TimeSlotLabel.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct TimeSlotLabel: View {
    
    let text: String
    let subTitle: String
    
    var body: some View {
        VStack(spacing: 20) {
            CustomText(font: .system(size: 16, weight: .semibold, design: .default), text: text)
                .padding()
                .background(Material.ultraThin)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            CustomText(font: .system(size: 12, weight: .regular, design: .default), text: subTitle)
        }
    }
}

#Preview {
    TimeSlotLabel(text: "10", subTitle: "Hours")
}
