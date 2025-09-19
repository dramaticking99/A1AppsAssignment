//
//  CustomTabBar.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack {
            TabBarButton(iconName: "house.fill")
            Spacer()
            TabBarButton(iconName: "magnifyingglass")
            Spacer()
            
            // Special middle button
            Button(action: {}) {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                    .padding(8)
                    .background(
                         LinearGradient(
                             gradient: Gradient(colors: [Color(red: 0.9, green: 0.2, blue: 0.4), Color(red: 0.5, green: 0.1, blue: 0.4)]),
                             startPoint: .top,
                             endPoint: .bottom
                         )
                    )
                    .clipShape(Circle())
                    .shadow(radius: 5)
            }
            
            Spacer()
            TabBarButton(iconName: "bell")
            Spacer()
            TabBarButton(iconName: "line.horizontal.3")
        }
        .padding(.horizontal, 30) // This padding keeps the icons from the screen edges
        .frame(height: 60) // Sets the height for the interactive part of the bar
        .background(
            // A background that ignores the bottom safe area.
            Color(.systemBackground)
                .ignoresSafeArea(edges: .bottom)
                .shadow(color: .black.opacity(0.1), radius: 8, x: 0, y: -5)
        )
    }
}

struct TabBarButton: View {
    let iconName: String
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.gray)
        }
    }
}
