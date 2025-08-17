//
//  Bid.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import Foundation

struct Bid: Equatable, Identifiable {

    let id: String
    let amount: Double
    let bidder: Bidder
    let timestamp: Date

}
