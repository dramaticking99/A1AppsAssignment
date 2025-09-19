//
//  APIResponse.swift
//  A1AppsAssignment
//
//  Created by Chetan Sanwariya on 19/09/25.
//

import SwiftUI

// This wrapper is needed because the person data is nested under a "data" key in the JSON.
struct APIResponse: Codable {
    let data: [InterviewPerson]
}
