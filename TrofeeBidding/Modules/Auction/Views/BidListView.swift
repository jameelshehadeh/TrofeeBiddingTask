//
//  BidListView.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 16/08/2025.
//

import SwiftUI

struct BidListView: View {
    
    let listTitle: String
    let bids: [Bid]
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            CustomText(font: .system(size: 16, weight: .bold, design: .default), text: listTitle)
            if bids.isEmpty {
                ContentUnavailableView {
                    Text("No Bids Yet")
                        .font(.system(size: 16, weight: .semibold, design: .default))
                } description: {
                    Text("Bids will be displayed here once they are placed.")
                        .font(.system(size: 14, weight: .medium, design: .default))
                } actions: {
                    
                }
            } else {
                ForEach(bids) { bid in
                    BidListItemView(bid: bid)
                }
            }
        }
    }
}

#Preview {
    BidListView(listTitle: "Bids",bids: [])
}
