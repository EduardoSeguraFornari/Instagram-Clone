//
//  FeedViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

import Foundation

@MainActor
@Observable
final class FeedViewModel {
    var posts = [Post]()

    private let feedService: FeedServiceProtocol
    private let userService: UserServiceProtocol

    init (feedService: FeedServiceProtocol, userService: UserServiceProtocol) {
        self.feedService = feedService
        self.userService = userService
        Task { await fetchPosts() }
    }

    func fetchPosts() async {
        do {
            self.posts = try await feedService.fetchPosts()
            for index in posts.indices {
                let post = posts[index]
                let ownerUid = post.ownerUid
                posts[index].user = try await userService.fetchUser(withId: ownerUid)
            }
        } catch {
            print("DEBUG: Failed to fetch posts with error: \(error.localizedDescription)")
        }
    }
}
