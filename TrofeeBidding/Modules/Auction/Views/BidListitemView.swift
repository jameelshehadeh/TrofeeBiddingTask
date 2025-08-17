//
//  BidListitemView.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 16/08/2025.
//

import SwiftUI

struct BidListItemView: View {
    
    let bid: Bid
    
    var body: some View {
        HStack {
            Text(bid.bidder.name)
                .font(.headline)
            Spacer()
            Text(bid.amount.formatted(.currency(code: "USD")))
            Text(bid.timestamp, style: .time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(height: 50)
        .background(Material.ultraThin)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    BidListItemView(bid: .init(id: UUID().uuidString, amount: 100, bidder: .init(id: UUID().uuidString, name: "Jameel"), timestamp: Date()))
}
