//
//  CommentsServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

final class CommentsServiceMock: CommentsServiceProtocol {
    func fetchComments(postId: String) async throws -> [Comment] {
        DeveloperPreview.commentsMock.filter { $0.postID == postId }
    }

    func uploadComment(_ comment: Comment, postId: String) async throws { }
}
