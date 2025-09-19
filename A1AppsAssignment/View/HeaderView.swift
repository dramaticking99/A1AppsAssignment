//
//  HeaderView.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            // MARK: - Background Layer
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.9, green: 0.2, blue: 0.4), Color(red: 0.5, green: 0.1, blue: 0.4)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea(edges: .top)
            
            // MARK: - Content Layer
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: "chevron.left")
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                .font(.title2.weight(.semibold))
                
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
        .frame(height: 120)
    }
}
