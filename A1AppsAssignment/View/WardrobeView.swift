//
//  WardrobeView.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

struct WardrobeView: View {
    
    @StateObject private var viewModel = WardrobeViewModel()
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HeaderView()
                
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .padding()
                        .frame(maxHeight: .infinity)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                        .frame(maxHeight: .infinity)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 64) {
                            ForEach(viewModel.people) { person in
                                OutfitCardView(person: person)
                            }
                        }
                        .padding()
                        .padding(.top, 24)
                    }
                }
            }
            
            VStack {
                Spacer()
                CustomTabBar()
            }
            .ignoresSafeArea(.keyboard)
        }
        .task {
            await viewModel.fetchData()
        }
    }
}

#Preview {
    WardrobeView()
}
