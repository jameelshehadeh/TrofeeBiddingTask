//
//  RandomBidGenerator.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 17/08/2025.
//

import Foundation

final class RandomBidGenerator: BidGenerating {
    
    private let simulatedUsers: [Bidder] = [
        .init(id: UUID().uuidString, name: "John"),
        .init(id: UUID().uuidString, name: "Jane"),
        .init(id: UUID().uuidString, name: "Michael")
    ]
    
    func generateBid() -> Bid {
        let user = simulatedUsers.randomElement()!
        let amount = Double.random(in: 1...10)
        return Bid(
            id: UUID().uuidString,
            amount: amount,
            bidder: user,
            timestamp: .now
        )
    }
}
