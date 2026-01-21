//
//  PostServiceProtocol.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

protocol PostServiceProtocol {
    func fetchPosts() async throws -> [Post]
    func fetchUserPosts(id: String) async throws -> [Post]
}
