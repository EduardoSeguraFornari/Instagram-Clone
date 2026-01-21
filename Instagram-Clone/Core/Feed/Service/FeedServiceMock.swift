//
//  FeedServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

final class FeedServiceMock: FeedServiceProtocol {
    func fetchPosts() async throws -> [Post] {
        return Post.postsMock
    }
}
