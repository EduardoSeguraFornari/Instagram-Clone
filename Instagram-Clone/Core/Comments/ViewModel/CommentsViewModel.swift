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
            await fetchUserDataForComments()
        } catch {
            print("DEBUG: Failed to fetch comments with error: \(error.localizedDescription)")
        }
    }

    func uploadComment() async {
        do {
            guard let currentUserId = Authentication.shared.user?.id else { return }
            var comment = Comment(
                postOwnerUid: post.ownerUid,
                commentText: text,
                postID: post.id,
                timestamp: Timestamp(),
                commentOwnerUid: currentUserId
            )
            comment.user = Authentication.shared.user
            try await service.uploadComment(comment, postId: post.id)
            comments.insert(comment, at: 0)
            text = ""
        } catch {
            print("DEBUG: Failed to upload comment with error: \(error.localizedDescription)")
        }
    }

    private func fetchUserDataForComments() async {
        do {
            for index in comments.indices {
                comments[index].user = try await UserService().fetchUser(withId: comments[index].postOwnerUid)
            }
        } catch {
            print("DEBUG: Failed to fetch user data for comments with error: \(error.localizedDescription)")
        }
    }
}
