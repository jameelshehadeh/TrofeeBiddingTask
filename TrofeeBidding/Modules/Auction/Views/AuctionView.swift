//
//  AuctionView.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 15/08/2025.
//

import SwiftUI

struct AuctionView: View {
    
    @StateObject private var viewModel = AuctionViewModel()
    @FocusState private var isFocused: Bool
    @State private var isCreateAuctionPresented: Bool = false
    @State private var isEndAuctionPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ScrollView {
                        VStack(alignment:.leading,spacing:20) {
                            Group {
                                CustomFormTextField(title: "Your Name", placeholder: "Your Name", text: $viewModel.userName)
                                CustomFormTextField(title: "Your Bid", placeholder: "Your Your Bid", keyboardType:.decimalPad,text: $viewModel.bidAmount)
                                CustomButton(title: "Place Bid", buttonStyle: .filled,action: {
                                    viewModel.placeUserBid()
                                    isFocused = false
                                })
                            }
                            .focused($isFocused)
                            .disabledWithOpacity(!viewModel.isAuctionRunning)
                            if let currentWinner = viewModel.currentAuction?.winningBid?.bidder {
                                CustomFormTextLabel(title: "Current Winner", text: currentWinner.name)
                            }
                            CustomFormTextLabel(title: "Current Price", text: viewModel.currentPrice.formatted(.currency(code: "USD")))
                            AuctionTimeView(timeRemaining: viewModel.timeRemaining)
                            BidListView(listTitle: "Recent Bids",bids: viewModel.recentBids)
                        }
                        .padding()
                    }
                    .scrollDismissesKeyboard(.immediately)
                    CustomButton(title: viewModel.isAuctionRunning ? "End Auction" : "Create Auction", buttonStyle: .gray, action:  {
                        viewModel.isAuctionRunning ? isEndAuctionPresented.toggle() : isCreateAuctionPresented.toggle()
                    })
                    .padding()
                }
                if isEndAuctionPresented {
                    CustomPopUp(isPresented: $isEndAuctionPresented, title: "End Auction", message: "Are you sure you want to end the auction?") {
                        CustomButton(title: "End Auction", action:  {
                            viewModel.endAuction()
                            isEndAuctionPresented.toggle()
                        })
                    }
                }
            }
            .navigationTitle("Trofee Bidding")
            .sheet(isPresented: $isCreateAuctionPresented) {
                CreateAuctionSheet { startPrice, durationInSeconds in
                    viewModel.startNewAuction(durationSeconds: durationInSeconds,startPrice: startPrice)
                }
            }
        }
    }
}

#Preview {
    AuctionView()
}
