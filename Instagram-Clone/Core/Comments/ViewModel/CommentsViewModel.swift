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
    var text = ""

    private let post: Post
    private let service: CommentsServiceProtocol

    init(post: Post, service: CommentsServiceProtocol) {
        self.post = post
        self.service = service
    }

    func fetchComments() async {
        do {
            self.comments = try await service.fetchComments(postId: post.id)
        } catch {
            print("DEBUG: Failed to fetch comments with error: \(error.localizedDescription)")
        }
    }

    func uploadComment() async {
        do {
            guard let currentUserId = Authentication.shared.user?.id else { return }
            let comment = Comment(
                postOwnerUid: post.ownerUid,
                commentText: text,
                postID: post.id,
                timestamp: Timestamp(),
                commentOwnerUid: currentUserId
            )
            try await service.uploadComment(comment, postId: post.id)
            text = ""
            await fetchComments()
        } catch {
            print("DEBUG: Failed to upload comment with error: \(error.localizedDescription)")
        }
    }
}
