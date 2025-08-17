//
//  AuctionStatus.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import Foundation

enum AuctionStatus: Equatable {
    case running(endAt: Date)
    case ended
}
