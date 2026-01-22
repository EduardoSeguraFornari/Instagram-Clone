//
//  CommentsServiceProtocol.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

protocol CommentsServiceProtocol {
    func ulploadComment(_ comment: Comment, postId: String) async throws
}
