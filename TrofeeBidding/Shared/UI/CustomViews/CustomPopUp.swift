//
//  CustomPopUp.swift
//  TrofeeBidding
//
//  Created by Jameel Shehadeh on 16/08/2025.
//

import SwiftUI

struct CustomPopUp<Content:View>: View {
    
    @Binding var isPresented : Bool
    var title: String?
    var message: String?
    private var actionsContent: () -> Content
    
    init(isPresented: Binding<Bool>, title: String? = nil, message: String? = nil, @ViewBuilder actionsContent: @escaping () -> Content) {
        self._isPresented = isPresented
        self.title = title
        self.message = message
        self.actionsContent = actionsContent
    }
    
    var body: some View {
        ZStack {
            Color(.black)
                .opacity(0.4)
            VStack {
                HStack {
                    CustomText(font: .system(size: 16, weight: .bold, design: .default), text: title ?? "")
                        .padding()
                    Spacer()
                    Button {
                        isPresented = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.primary)
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity, maxHeight: 60)
                HStack {
                    CustomText(font: .system(size: 16, weight: .semibold, design: .default), text: message ?? "")
                        .padding()
                        .frame(maxWidth:.infinity,alignment:.leading)
                        .padding(.top)
                }
                actionsContent()
                    .frame(maxWidth: .infinity)
                    .padding()
            }
            .background(Material.ultraThin)
            .cornerRadius(10)
            .padding()
        }
        .ignoresSafeArea()
    }
}
