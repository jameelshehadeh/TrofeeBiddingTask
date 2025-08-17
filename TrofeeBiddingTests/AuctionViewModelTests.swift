//
//  AuctionViewModelTests.swift
//  TrofeeBiddingTests
//
//  Created by Jameel Shehadeh on 17/08/2025.
//

import XCTest
import Combine
@testable import TrofeeBidding

final class AuctionViewModelTests: XCTestCase {
    
    private var viewModel: AuctionViewModel!
    private var bidSimulator: TestBidSimulator!
    private var timerProvider: TestTimerProvider!

    final class TestBidSimulator: BidSimulating {
        let subject = PassthroughSubject<Bid, Never>()
        var bidPublisher: AnyPublisher<Bid, Never> { subject.eraseToAnyPublisher() }
    }

    final class TestTimerProvider: AuctionTimerProviding {
        let subject = PassthroughSubject<Date, Never>()
        func timerPublisher(until endDate: Date) -> AnyPublisher<Date, Never> {
            subject.eraseToAnyPublisher()
        }
    }

    override func setUp() {
        super.setUp()
        bidSimulator = TestBidSimulator()
        timerProvider = TestTimerProvider()
        viewModel = AuctionViewModel(timerProvider: timerProvider, bidSimulator: bidSimulator)
    }

    override func tearDown() {
        viewModel = nil
        bidSimulator = nil
        timerProvider = nil
        super.tearDown()
    }

    func testUserBidUpdatesCurrentPriceAndRecentBids() {
        
        viewModel.startNewAuction(startPrice: 50)

        viewModel.userName = "Alice"
        viewModel.bidAmount = "70"
        viewModel.placeUserBid()

        XCTAssertEqual(viewModel.currentPrice, 70)
        XCTAssertEqual(viewModel.recentBids.count, 1)
        XCTAssertEqual(viewModel.recentBids.first?.bidder.name, "Alice")
        XCTAssertEqual(viewModel.userName, "")
        XCTAssertEqual(viewModel.bidAmount, "")
    }
    
    func testSimulatedBidUpdatesCurrentPriceAndRecentBids() {
        viewModel.startNewAuction(startPrice: 50)

        let bidder = Bidder(id: UUID().uuidString, name: "Bot")
        let bid = Bid(id: UUID().uuidString, amount: 15, bidder: bidder, timestamp: .now)
        bidSimulator.subject.send(bid)

        XCTAssertEqual(viewModel.currentPrice, 65)
        XCTAssertEqual(viewModel.recentBids.count, 1)
        XCTAssertEqual(viewModel.recentBids.first?.bidder.name, "Bot")
    }
    
}
