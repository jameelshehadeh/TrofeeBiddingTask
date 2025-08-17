//
//  AuctionTimerProviding.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 16/08/2025.
//

import Combine
import Foundation

protocol AuctionTimerProviding {
    func timerPublisher(until endDate: Date) -> AnyPublisher<Date, Never>
}
