//
//  OutfitCardView.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

// A single card in the list, displaying one person's data.
struct OutfitCardView: View {
    let person: InterviewPerson
    
    // Define custom colors to match the design for easy reuse.
    private let brandRed = Color(red: 0.82, green: 0.15, blue: 0.33)
    private let brandPurple = Color(red: 0.35, green: 0.13, blue: 0.39)
    
    var body: some View {
        // Use a ZStack to layer the background and foreground content
        ZStack {
            
            // MARK: - Layer 1: The Glowing Background
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [brandRed.opacity(0.5), brandPurple.opacity(0.5)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .blur(radius: 20)
                .offset(y: 4)
                .padding(.horizontal, -4)
            
            // MARK: - Layer 2: The Background Card
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color(.systemBackground))
                .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
            
            // MARK: - Layer 3: The Foreground Content
            HStack(spacing: 16) {
                // Image View (Unchanged)
                AsyncImage(url: URL(string: person.image)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Color.gray.opacity(0.1)
                }
                .frame(width: 130, height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .offset(CGSize(width: 0, height: -10)) // Adjusted for better overlap

                // Details Section (Corrected Layout)
                VStack(alignment: .leading, spacing: 4) {
                    
                    // --- TOP CONTENT GROUP ---
                    Text(person.name)
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(.primary)
                        .lineLimit(2)
                        // This modifier helps make the text height calculation more stable
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("by " + person.email.components(separatedBy: "@").first!)
                        .font(.subheadline)
                        .fontWeight(.medium)
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [brandRed, brandPurple]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                    
                    HStack(spacing: 2) {
                        ForEach(0..<5) { index in
                            Image(systemName: index < 3 ? "star.fill" : "star")
                                .font(.system(size: 12))
                                .foregroundColor(brandRed)
                        }
                    }
                    
                    // --- SPACER ---
                    // This now correctly pushes the bottom content down consistently.
                    Spacer()
                    
                    // --- BOTTOM CONTENT GROUP ---
                    HStack {
                        Text("$\(person.age)")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.gray)
                        
                        Spacer() // Pushes the button to the right
                        
                        Button(action: {
                            print("Shop tapped for \(person.name)")
                        }) {
                            Text("Shop")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [brandRed, brandPurple]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .cornerRadius(18)
                        }
                    }
                }
                .padding([.vertical, .trailing], 16)
            }
            .padding(.leading, 10)
        }
        .frame(height: 160)
//        .padding(.horizontal)
    }
}

//// MARK: - Preview Provider
//
//#Preview {
//    // Create a static, dummy instance of the InterviewPerson model for the preview.
//    let dummyPerson = InterviewPerson (
//        image: "https://cdn.jsdelivr.net/gh/faker-js/assets-person-portrait/female/512/59.jpg",
//        email: "Abigail.Mohr98@gmail.com",
//        name: "Colorful white goun summer outfit",
//        age: 260,
//        dob: "1964-12-23"
//    )
//    
//    // Display the OutfitCardView with the dummy data.
//    // We add some padding and a gray background to make it look better in the canvas.
//    return OutfitCardView(person: dummyPerson)
//        .padding()
//        .background(Color.gray.opacity(0.2))
//}
