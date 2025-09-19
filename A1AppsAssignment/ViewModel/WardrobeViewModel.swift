//
//  WardroabViewModel.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

@MainActor // Ensures that all updates to @Published properties happen on the main thread.
class WardrobeViewModel: ObservableObject {
    
    @Published var people: [InterviewPerson] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    private let apiUrl = "https://core-apis.a1apps.co/ios/interview-details"
    
    func fetchData() async {
        guard let url = URL(string: apiUrl) else {
            errorMessage = "Invalid URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            // 1. Fetch data from the URL
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // 2. Decode the JSON into our model objects
            let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            
            // 3. Update the people array
            self.people = decodedResponse.data
            
        } catch {
            // 4. Handle any errors
            self.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
