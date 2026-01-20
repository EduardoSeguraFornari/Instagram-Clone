//
//  SearchViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Foundation

@MainActor
@Observable
final class SearchViewModel {
    var users = [User]()

    private let service: UserServiceProtocol

    init(service: UserServiceProtocol) {
        self.service = service
        Task { await fetchAllUsers() }
    }

    func fetchAllUsers() async {
        do {
            self.users = try await service.fetchAllUsers()
        } catch {
            
        }
    }
}
