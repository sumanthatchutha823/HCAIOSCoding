import Foundation

struct Repository: Identifiable, Codable, Equatable {
    let id: Int
    let name: String
    let description: String?
    let language: String?
    let stargazers_count: Int
    let forks_count: Int
    let updated_at: String

    enum CodingKeys: String, CodingKey {
        case id, name, description, language
        case stargazers_count, forks_count, updated_at
    }

    static func == (lhs: Repository, rhs: Repository) -> Bool {
        return lhs.id == rhs.id
    }
}
