# GitHub API Repositories

A SwiftUI-based iOS application to explore GitHub repositories. This app allows users to view repositories, filter them by programming language, and load additional repositories using pagination.

## Features
- **View GitHub Repositories**: Displays a list of repositories fetched from GitHub's API.
- **Filter by Language**: Enables filtering repositories based on programming languages.
- **Pagination Support**: Loads more repositories as the user scrolls to the bottom of the list.
- **Repository Details**: Shows detailed information about a selected repository, such as repository name, description, language, stars, forks, and the last updated date.

---

## Screenshots

### Repositories Home Screen
The home screen lists all GitHub repositories, with options to filter by language.

![Repositories Home](https://github.com/user-attachments/assets/f31f0d52-b216-4478-a4ca-f8a0c61bdcd0)
---

### Filtered Repositories
Users can select a language filter to view only repositories written in that language. For example, selecting "Python" filters the list accordingly.

![Python Language Repositories ](https://github.com/user-attachments/assets/9e898700-647a-47ec-a9ec-3bf62b0743f6)


---

### Repository Details
When a repository is selected, the app navigates to a detailed view showing the repository's description, language, stars, forks, and last updated date.

![Repositories details](https://github.com/user-attachments/assets/66e8468e-1887-438a-96e4-7f66f5885dd6)


### Pagination
Loads more repositories as the user scrolls to the bottom of the list.

![Repositories Pagination](https://github.com/user-attachments/assets/90ab96fb-8874-4902-b01c-453ba6c47700)
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

