//
//  HeaderView.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

// The header section with the gradient and title.
struct HeaderView: View {
    var body: some View {
        ZStack {
            // MARK: - Background Layer
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.9, green: 0.2, blue: 0.4), Color(red: 0.5, green: 0.1, blue: 0.4)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(edges: .top) // Allow the gradient to extend into the status bar area

            // MARK: - Content Layer
            VStack(alignment: .leading, spacing: 4) {
                // Top row with icons and centered title
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .font(.title2.weight(.semibold)) // Apply modifier to all icons in the HStack
                
                Spacer()
                
                VStack {
                    Text("Summer")
                        .font(.largeTitle)
                    
                    Text("96 Wardrobes")
                        .font(.headline)
                        .opacity(0.7)
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(height: 120) // Give the header a consistent, fixed height
    }
}
