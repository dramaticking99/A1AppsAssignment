//
//  InterviewPerson.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

struct InterviewPerson: Codable, Identifiable {
    // Using email as a unique ID for the list.
    var id: String { email }
    
    let image: String
    let email: String
    let name: String
    let age: Int
    
    let dob: String
    
    private enum CodingKeys: String, CodingKey {
        case image, email, name, age, dob
    }
}
