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

    private let postService: PostServiceProtocol

    init (postService: PostServiceProtocol) {
        self.postService = postService
        Task { await fetchPosts() }
    }

    func fetchPosts() async {
        do {
            self.posts = try await postService.fetchPosts()
        } catch {
            print("DEBUG: Failed to fetch posts with error: \(error.localizedDescription)")
        }
    }
}
