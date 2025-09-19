# A1Apps iOS SwiftUI Assignment

This project is a modern iOS application built entirely with SwiftUI, designed to fulfill the requirements of the A1Apps assignment. It showcases a clean, scalable architecture and a polished, responsive user interface that fetches and displays data from a remote API.

---

## ✨ Features

* **Dynamic UI**: The main screen displays a dynamic list of items fetched from a live JSON API.
* **Asynchronous Data Fetching**: Utilizes modern Swift Concurrency (`async`/`await`) for efficient, non-blocking network requests.
* **Custom UI Components**: The entire UI is built from scratch with custom, reusable SwiftUI views for:
    * An overlapping header that the scroll view slides beneath.
    * Stylized item cards with glowing borders and overlapping images.
    * A custom tab bar with a central floating-action-button style.
* **MVVM Architecture**: Strictly follows the Model-View-ViewModel design pattern for a clear separation of concerns, making the code clean, testable, and easy to maintain.
* **Polished Design**: Implements advanced UI effects to precisely match the provided design mockups.

---

## 🏛️ Architecture: MVVM

The project is structured using the **Model-View-ViewModel (MVVM)** pattern:

### Model

* **File**: `InterviewPerson.swift`
* **Responsibility**: Defines the data structure (`InterviewPerson` and `APIResponse`). It is a simple, `Codable` representation of the JSON data received from the API.

### View

* **Files**: `WardrobeView.swift`, `HeaderView.swift`, `OutfitCardView.swift`, `CustomTabBar.swift`
* **Responsibility**: Comprises all the SwiftUI views. These views are lightweight and "dumb"—their only job is to display data provided by the ViewModel and relay user input back to it.

### ViewModel

* **File**: `WardrobeViewModel.swift`
* **Responsibility**: Acts as the bridge between the Model and the View. It fetches data from the API, contains the business logic, and exposes the data to the View through `@Published` properties. The View observes the ViewModel and automatically updates whenever the data changes.

---

## 🛠️ Technologies Used

* **Language**: Swift 5+
* **UI Framework**: SwiftUI
* **Concurrency**: Swift Concurrency (`async`/`await`)
* **Minimum OS**: iOS 15.0+
* **IDE**: Xcode 15+

---

## 🚀 How to Run

1.  Clone or download the project repository to your local machine.
2.  Open the `.xcodeproj` file in Xcode.
3.  Select an iOS simulator (e.g., iPhone 15 Pro) or connect a physical device.
4.  Click the "Run" button (▶) in Xcode to build and run the application.
