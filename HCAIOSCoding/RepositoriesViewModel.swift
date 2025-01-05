import SwiftUI
import Combine

class RepositoriesViewModel: ObservableObject {
    @Published var repositories: [Repository] = []
    @Published var filteredRepositories: [Repository] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    private var currentPage = 1
    private var cancellables = Set<AnyCancellable>()

    let baseURL = "https://api.github.com/users/google/repos"

    func fetchRepositories(reset: Bool = false) {
        if reset {
            repositories = []
            filteredRepositories = []
            currentPage = 1
        }

        guard !isLoading else { return }

        guard let url = URL(string: "\(baseURL)?page=\(currentPage)&per_page=10") else {
            self.errorMessage = "Invalid URL"
            return
        }

        isLoading = true
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data, response) in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [Repository].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] completion in
                self?.isLoading = false
                switch completion {
                case .failure(let error):
                    self?.errorMessage = "Failed to load data: \(error.localizedDescription)"
                case .finished: break
                }
            }, receiveValue: { [weak self] repositories in
                if repositories.isEmpty {
                    self?.errorMessage = "No more repositories to load."
                    return
                }
                self?.repositories.append(contentsOf: repositories)
                self?.filteredRepositories = self?.repositories ?? []
                self?.currentPage += 1
            })
            .store(in: &cancellables)
    }

    func filterRepositories(by language: String) {
        if language.isEmpty {
            filteredRepositories = repositories
        } else {
            filteredRepositories = repositories.filter { $0.language?.lowercased() == language.lowercased() }
        }
    }
}

