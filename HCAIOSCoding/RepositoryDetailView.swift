//
//  RepositoryDetailView.swift
//  HCAIOSCoding
//
//  Created by Sumanth Atchutha on 1/4/25.
//

import Foundation
import SwiftUI

struct RepositoryDetailView: View {
    let repository: Repository

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Repository Name: \(repository.name)")
                .font(.body)
            Text("Description: \(repository.description ?? "No description available")")
                .font(.body)
            Text("Language: \(repository.language ?? "Unknown")")
                .font(.callout)
            Text("Stars: \(repository.stargazers_count)")
                .font(.callout)
            Text("Forks: \(repository.forks_count)")
                .font(.callout)
            Text("Last updated: \(repository.updated_at)")
                .font(.callout)
            Spacer()
        }
        .padding()
        .navigationTitle("Repository Details")
    }
}

