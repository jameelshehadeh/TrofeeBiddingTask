//
//  SimulatedBidProvider.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 16/08/2025.
//

import Foundation
import Combine

class SimulatedBidProvider: BidSimulating {
     
    private let bidGenerator: BidGenerating
    
    init(bidGenerator: BidGenerating = RandomBidGenerator()) {
        self.bidGenerator = bidGenerator
    }
    
    var bidPublisher: AnyPublisher<Bid, Never> {
        Timer.publish(every: Double.random(in: 2...5), on: .main, in: .common)
            .autoconnect()
            .compactMap { [weak self] _ in
                self?.bidGenerator.generateBid()
            }
            .eraseToAnyPublisher()
    }
    
}
