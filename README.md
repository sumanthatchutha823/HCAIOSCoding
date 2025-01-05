# GitHub API Repositories

A SwiftUI-based iOS application to explore GitHub repositories. This app allows users to view repositories, filter them by programming language, and load additional repositories using pagination.

## Features
- **View GitHub Repositories**: Displays a list of repositories fetched from GitHub's API.
- **Filter by Language**: Enables filtering repositories based on programming languages.
- **Pagination Support**: Loads more repositories as the user scrolls to the bottom of the list.
- **Repository Details**: Shows detailed information about a selected repository, such as repository name, description, language, stars, forks, and the last updated date.

---

## Screenshots

### Home Screen
The home screen lists all GitHub repositories, with options to filter by language. A progress indicator appears while loading data.

![Simulator Screenshot - iPhone 16 Pro - 2025-01-05 at 15 55 59](https://github.com/user-attachments/assets/0b9852de-fd23-4651-b04b-e247488c9b29)

---

### Filtered Repositories
Users can select a language filter to view only repositories written in that language. For example, selecting "Java" filters the list accordingly.



---

### Repository Details
When a repository is selected, the app navigates to a detailed view showing the repository's description, language, stars, forks, and last updated date.



---

## Implementation

### **1. API Integration**
The app integrates with GitHub's REST API to fetch repositories. The `RepositoriesViewModel` manages the API calls and stores the list of repositories.

Key implementation files:
- `RepositoriesViewModel.swift`: Handles API calls, pagination logic, and filtering functionality.
- `Repository.swift`: The data model representing a GitHub repository.

---

### **2. UI Components**
The app is built using SwiftUI:
- **ContentView.swift**: Main view that displays the list of repositories and the filter options.
- **RepositoryDetailView.swift**: Detail view that displays information about a selected repository.

**ScrollView and LazyVStack** are used for efficient rendering of repository lists, along with a `NavigationView` for seamless navigation.

---

### **3. Pagination**
The app supports infinite scrolling by fetching more repositories as the user reaches the end of the list. The logic is implemented in `ContentView.swift`



## Requirements
- iOS 14.0+
- Swift 5
- Xcode 14 or later

## How to Run
1. Clone the repository: git clone https://github.com/sumanthatchutha823/HCAIOSCoding
2. Open the project in Xcode.
3. Run the app on a simulator.

