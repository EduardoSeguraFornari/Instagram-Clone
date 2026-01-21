//
//  PostServiceProtocol.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

protocol PostServiceProtocol {
    func checkIfUserLikedPost(_ post: Post) async throws -> Bool
    func fetchPosts() async throws -> [Post]
    func fetchUserPosts(id: String) async throws -> [Post]
    func likePost(_ post: Post) async throws
    func unlikePost(_ post: Post) async throws
}
