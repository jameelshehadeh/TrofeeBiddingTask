//
//  CustomButtonStyle.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

enum CustomButtonStyle {
    
    case filled
    case gray
    
    var foregroundColor: Color {
        switch self {
        case .filled:
                .white
        case .gray:
                .primary
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .filled:
            return .red
        case .gray:
            return .gray.opacity(0.3)
        }
    }
    
    var borderColor: Color {
        switch self {
        case .filled:
            return  .red
        case .gray:
            return .clear
        }
    }
    
}
