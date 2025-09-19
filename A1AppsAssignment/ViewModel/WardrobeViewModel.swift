//
//  WardroabViewModel.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

@MainActor
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
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(APIResponse.self, from: data)
            self.people = decodedResponse.data
        } catch {
            self.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
        }
        
        isLoading = false
    }
}
