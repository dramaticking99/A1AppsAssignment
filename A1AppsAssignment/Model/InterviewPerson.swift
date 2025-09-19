//
//  InterviewPerson.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

// Represents a single person's data.
// Conforms to Codable for JSON decoding and Identifiable for use in SwiftUI lists.
struct InterviewPerson: Codable, Identifiable {
    // Using email as a unique ID for the list.
    var id: String { email }
    
    let image: String
    let email: String
    let name: String
    let age: Int
    
    // dob is in the JSON but not used in the UI, so we just include it for complete decoding.
    let dob: String
    
    // Maps the JSON keys to our struct properties.
    private enum CodingKeys: String, CodingKey {
        case image, email, name, age, dob
    }
}
