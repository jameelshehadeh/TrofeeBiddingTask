//
//  CustomFormTextField.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct CustomFormTextField: View {
    
    let title: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    @Binding var text: String
    
    init(title: String, placeholder: String,keyboardType:UIKeyboardType = .default, text: Binding<String>) {
        self.title = title
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self._text = text
    }
    
    var body: some View {
        VStack(alignment:.leading,spacing: 10) {
            CustomText(font: .system(size: 16, weight: .bold, design: .default), text: title)
            TextField(placeholder, text: $text)
                .frame(height: 56)
                .padding(.horizontal, 16)
                .keyboardType(keyboardType)
                .background(.thinMaterial)
                .cornerRadius(12)
                .overlay {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(.black.opacity(0.2), lineWidth: 1)
                }
        }
    }
}

#Preview {
    CustomFormTextField(title: "Title", placeholder: "PlaceHolder", text: .constant("Text"))
}
