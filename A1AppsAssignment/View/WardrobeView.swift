//
//  WardrobeView.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

// The main view that assembles all the smaller UI components.
struct WardrobeView: View {
    
    @StateObject private var viewModel = WardrobeViewModel()
    
    var body: some View {
        ZStack {
            // Background color for the main list area
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                HeaderView()
                
                // Display a loading spinner, an error message, or the list of people
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
            
            // Overlay the Tab Bar at the bottom
            VStack {
                Spacer()
                CustomTabBar()
            }
            .ignoresSafeArea(.keyboard) // Ensures tab bar stays visible when keyboard shows
        }
        .task {
            // This is the modern way to call an async function when a view appears.
            await viewModel.fetchData()
        }
    }
}

#Preview {
    WardrobeView()
}
