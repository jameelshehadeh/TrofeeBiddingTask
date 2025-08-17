//
//  CreateAuctionSheet.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct CreateAuctionSheet: View {
    
    @State private var auctionStartPrice: String = ""
    @State private var auctionDurationInSeconds: Int = 0
    @Environment(\.dismiss) var dismiss
    
    var auctionStartPriceAsDouble: Double {
        Double(auctionStartPrice) ?? 0
    }
    
    var createAction: ((_ startPrice: Double, _ durationInSeconds: Int) -> Void)?
    
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Capsule(style: .continuous)
                    .fill(Color.gray)
                    .frame(width: 40, height: 5)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                CustomFormTextField(title: "Auction Start Price", placeholder: "Enter Auction Start Price", keyboardType:.decimalPad,text: $auctionStartPrice)
                DurationPicker(auctionDurationInSeconds: $auctionDurationInSeconds)
                Spacer()
                CustomButton(title: "Start Auction", buttonStyle: .gray, action:  {
                    guard validateInput() else {return}
                    createAction?(auctionStartPriceAsDouble, auctionDurationInSeconds)
                    dismiss()
                })
            }
            .padding()
        }
        .presentationDetents(.init(arrayLiteral: .fraction(0.7)))
    }
    
    private func validateInput() -> Bool {
        guard !auctionStartPrice.isEmpty, auctionStartPriceAsDouble > 0, auctionDurationInSeconds > 0 else {
            return false
        }
        return true
    }
    
}

#Preview {
    CreateAuctionSheet()
}
