//
//  FeedCellViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Foundation

@MainActor
@Observable
final class FeedCellViewModel {
    var post: Post

    private let service: PostServiceProtocol

    init(post: Post, service: PostServiceProtocol) {
        self.post = post
        self.service = service
        Task { await checkIfUserLikedPost() }
    }

    func like() async {
        do {
            let postCopy = post
            post.didLike = true
            post.likes += 1
            try await service.likePost(postCopy)
        } catch {
            post.didLike = false
            post.likes -= 1
        }
    }

    func unlike() async {
        do {
            let postCopy = post
            post.didLike = false
            post.likes -= 1
            try await service.unlikePost(postCopy)
        } catch {
            post.didLike = true
            post.likes += 1
        }
    }

    func checkIfUserLikedPost() async {
        do {
            self.post.didLike = try await service.checkIfUserLikedPost(post)
        } catch {
            print("DEBUG: Failed to check if user liked post with error: \(error.localizedDescription)")
        }
    }
}
