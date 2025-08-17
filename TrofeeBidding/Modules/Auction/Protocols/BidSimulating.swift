//
//  BidSimulating.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 16/08/2025.
//

import Foundation
import Combine

protocol BidSimulating {
    var bidPublisher: AnyPublisher<Bid, Never> { get }
}
