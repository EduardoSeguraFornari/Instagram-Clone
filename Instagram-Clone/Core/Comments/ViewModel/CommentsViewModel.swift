//
//  CommentsViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

import Firebase

@MainActor
@Observable
final class CommentsViewModel {
    var comments = [Comment]()

    private let post: Post
    private let service: CommentsServiceProtocol

    init(post: Post, service: CommentsServiceProtocol) {
        self.post = post
        self.service = service
    }

    func ulploadComment(commentText: String) async {
        do {
            guard let currentUserId = Authentication.shared.user?.id else { return }
            let comment = Comment(
                postOwnerUid: post.ownerUid,
                commentText: commentText,
                postID: post.id,
                timestamp: Timestamp(),
                commentOwnerUid: currentUserId
            )
            try await service.ulploadComment(comment, postId: post.id)
        } catch {
            print("DEBUG: Failed to upload comment with error: \(error.localizedDescription)")
        }
    }
}
