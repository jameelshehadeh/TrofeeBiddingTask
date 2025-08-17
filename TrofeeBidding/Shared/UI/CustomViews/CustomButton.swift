//
//  CustomButton.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct CustomButton: View {
    
    var title: String
    var action: (()->())?
    var buttonStyle: CustomButtonStyle = .filled
    var onTapGesture: (() -> Void)?
    
    init(title: String, buttonStyle: CustomButtonStyle = .filled,onTapGesture: (() -> Void)? = nil,action: ( () -> Void)? = nil) {
        self.title = title
        self.onTapGesture = onTapGesture
        self.action = action
        self.buttonStyle = buttonStyle
    }

    var body: some View {
        if let onTapGesture {
            CustomButtonLabel()
                .onTapGesture {
                    onTapGesture()
                }
        } else {
            Button {
                action?()
            } label: {
                CustomButtonLabel()
            }
        }
    }
    
    @ViewBuilder func CustomButtonLabel() -> some View {
        Text(title)
            .font(.headline)
            .padding()
            .frame(maxWidth:.infinity)
            .frame(height: 45)
            .foregroundColor(buttonStyle.foregroundColor)
            .background(buttonStyle.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(buttonStyle.borderColor, lineWidth: 1)
            }
            .contentShape(.rect)
    }
}
