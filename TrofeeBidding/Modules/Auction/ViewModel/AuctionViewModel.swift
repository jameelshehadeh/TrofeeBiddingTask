//
//  AuctionViewModel.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import Foundation
import Combine

class AuctionViewModel: ObservableObject {
    
    @Published var userName: String = ""
    @Published var bidAmount: String = ""
    
    @Published private(set) var currentAuction: Auction?
    @Published private(set) var currentPrice: Double = 50.0
    @Published private(set) var timeRemaining: (hours: Int, minutes: Int, seconds: Int) = (0, 0, 0)
    @Published private(set) var recentBids: [Bid] = []
    
    var isAuctionRunning: Bool {
        if case .running = currentAuction?.status { true } else { false }
    }
    
    private let timerProvider: AuctionTimerProviding
    private let bidSimulator: BidSimulating
    
    private var cancellables = Set<AnyCancellable>()
    
    init(timerProvider: AuctionTimerProviding = TimerProvider(),
         bidSimulator: BidSimulating = SimulatedBidProvider()) {
        self.timerProvider = timerProvider
        self.bidSimulator = bidSimulator
    }
    
    func startNewAuction(durationSeconds: Int = 30, startPrice: Double = 50.0) {
        guard durationSeconds > 0 , startPrice > 0 else { return }
        
        currentPrice = startPrice
        currentAuction = .init(
            id: UUID().uuidString,
            startingPrice: startPrice,
            status: .running(endAt: Date().addingTimeInterval(TimeInterval(durationSeconds)))
        )
        
        recentBids.removeAll()
        cancellables.removeAll()
        startTimer()
        startSimulatedBids()
    }
    
    func placeBid(by bidder: Bidder, amount: Double) {
        guard case .running(_) = currentAuction?.status, amount > currentPrice else { return }
        currentPrice = amount
        let bid = Bid(id: UUID().uuidString, amount: amount, bidder: bidder, timestamp: .now)
        currentAuction?.winningBid = bid
        recentBids.insert(bid, at: 0)
    }
    
    func placeUserBid() {
        guard let amount = Double(bidAmount), !userName.isEmpty else { return }
        placeBid(by: .init(id: UUID().uuidString, name: userName), amount: amount)
        bidAmount = ""
        userName = ""
    }
    
    func endAuction() {
        currentAuction?.status = .ended
        cancellables.removeAll()
    }
    
    private func startTimer() {
        guard case let .running(endDate) = currentAuction?.status else { return }
        
        timerProvider.timerPublisher(until: endDate)
            .sink { [weak self] _ in
                self?.updateTimeRemaining(until: endDate)
            }
            .store(in: &cancellables)
    }
    
    private func updateTimeRemaining(until endDate: Date) {
        let diff = Calendar.current.dateComponents([.hour, .minute, .second], from: Date(), to: endDate)
        if let hours = diff.hour, let minutes = diff.minute, let seconds = diff.second {
            timeRemaining = (hours, minutes, seconds)
            if hours <= 0 && minutes <= 0 && seconds <= 0 { endAuction() }
        }
    }
    
    private func startSimulatedBids() {
        bidSimulator.bidPublisher
            .sink { [weak self] bid in
                guard let self else { return }
                let newAmount = self.currentPrice + bid.amount
                self.placeBid(by: bid.bidder, amount: newAmount)
            }
            .store(in: &cancellables)
    }
    
}
