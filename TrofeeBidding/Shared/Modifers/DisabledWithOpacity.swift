//
//  DisabledWithOpacity.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

extension View {
    
    func disabledWithOpacity(_ isDisabled: Bool) -> some View {
        self
            .disabled(isDisabled)
            .opacity(isDisabled ? 0.5 : 1.0)
    }
    
}
