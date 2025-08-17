//
//  Auction.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import Foundation

struct Auction: Equatable {
    
    let id: String
    let startingPrice: Double
    var status: AuctionStatus
    var winningBid: Bid?

    var currentPrice: Double {
        winningBid?.amount ?? startingPrice
    }
    
}
