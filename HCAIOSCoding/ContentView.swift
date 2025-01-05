import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var viewModel = RepositoriesViewModel()
    @State private var selectedLanguage: String = ""
    private let languages = ["", "Swift", "JavaScript", "Python", "Java"]

    var body: some View {
        NavigationView {
            VStack {
                Picker("Filter by Language", selection: $selectedLanguage) {
                    ForEach(languages, id: \.self) { language in
                        Text(language.isEmpty ? "All" : language).tag(language)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .onChange(of: selectedLanguage) { newValue in
                    viewModel.filterRepositories(by: newValue)
                }

                if viewModel.isLoading && viewModel.repositories.isEmpty {
                    ProgressView("Loading repositories...")
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else {
                    List(viewModel.filteredRepositories) { repo in
                        NavigationLink(destination: RepositoryDetailView(repository: repo)) {
                            VStack(alignment: .leading) {
                                Text(repo.name)
                                    .font(.headline)
                                Text(repo.description ?? "No description available")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                                Text("Language: \(repo.language ?? "Unknown")")
                                    .font(.footnote)
                            }
                        }
                        .onAppear {
                            // Trigger fetch for the next page
                            if repo == viewModel.filteredRepositories.last && !viewModel.isLoading {
                                viewModel.fetchRepositories()
                            }
                        }
                    }
                    .listStyle(PlainListStyle()) // Ensure default scrollable style
                }
            }
            .navigationTitle("Repositories")
            .onAppear {
                viewModel.fetchRepositories(reset: true)
            }
        }
    }
}

