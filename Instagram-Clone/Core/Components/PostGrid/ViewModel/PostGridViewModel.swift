//
//  PostGridViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

import Foundation

@MainActor
@Observable
final class PostGridViewModel {
    var posts = [Post]()
    let user: User

    private let service: PostServiceProtocol

    init(service: PostServiceProtocol, user: User) {
        self.service = service
        self.user = user
        Task { await fetchUserPosts() }
    }

    func fetchUserPosts() async {
        do {
            self.posts = try await service.fetchUserPosts(id: user.id)
        } catch {
            print("DEBUG: Failed to update user data with error: \(error.localizedDescription)")
        }
    }
}
