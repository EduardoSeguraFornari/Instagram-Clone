//
//  FeedServiceProtocol.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

protocol FeedServiceProtocol {
    func fetchPosts() async throws -> [Post]
}
