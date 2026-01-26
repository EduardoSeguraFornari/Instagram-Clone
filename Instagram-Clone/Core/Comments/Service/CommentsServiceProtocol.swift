//
//  CommentsServiceProtocol.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

protocol CommentsServiceProtocol {
    func fetchComments(postId: String) async throws -> [Comment]
    func uploadComment(_ comment: Comment, postId: String) async throws
}
