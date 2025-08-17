//
//  CircleSpinnerView.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct CircleSpinnerView: View {
    
    @State var isAnimating = false
    
    var loaderColor: Color
    var loaderSize: CGFloat
    
    init(loaderColor: Color = Color.primary,loaderSize: CGFloat = 30) {
        self.loaderColor = loaderColor
        self.loaderSize = loaderSize
    }
    
    var body: some View {
        Circle()
            .trim(from: 0, to: 0.7)
            .stroke(loaderColor, lineWidth: 4)
            .frame(width: loaderSize, height: loaderSize)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .foregroundColor(Color.blue)
            .onAppear {
                withAnimation(Animation
                    .linear(duration: 0.6)
                    .repeatForever(autoreverses: false)) {
                        self.isAnimating = true
                    }
            }
    }
}
