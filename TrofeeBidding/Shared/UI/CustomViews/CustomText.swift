//
//  CustomText.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct CustomText: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    let font: Font
    let text: String
    let linesLimit: Int?
    let multilineTextAlignment: TextAlignment
    
    init(font: Font, text: String,multilineTextAlignment: TextAlignment = .leading, linesLimit: Int? = nil) {
        self.multilineTextAlignment = multilineTextAlignment
        self.font = font
        self.text = text
        self.linesLimit = linesLimit
    }
    
    var body: some View {
        Text(text)
            .lineLimit(linesLimit)
            .font(font)
            .foregroundStyle(.primary)
            .multilineTextAlignment(multilineTextAlignment)
    }
}
