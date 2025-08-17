//
//  CustomFormTextLabel.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct CustomFormTextLabel: View {
    
    let title: String
    var text: String
    
    var body: some View {
        VStack(alignment:.leading) {
            CustomText(font: .headline, text: title)
            CustomText(font: .body, text: text)
        }
    }
}

#Preview {
    CustomFormTextLabel(title: "Title", text: "Text")
}
