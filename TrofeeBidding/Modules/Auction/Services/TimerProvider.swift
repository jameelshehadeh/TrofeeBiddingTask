//
//  TimerProvider.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 16/08/2025.
//

import Foundation
import Combine

class TimerProvider: AuctionTimerProviding {
    
    func timerPublisher(until endDate: Date) -> AnyPublisher<Date, Never> {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .prefix(while: { _ in Date() <= endDate })
            .eraseToAnyPublisher()
    }
    
}
