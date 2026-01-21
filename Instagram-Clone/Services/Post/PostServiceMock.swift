//
//  PostServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

final class PostServiceMock: PostServiceProtocol {
    func fetchPosts() async throws -> [Post] {
        Post.postsMock
    }

    func fetchUserPosts(id: String) async throws -> [Post] {
        Post.postsMock.filter { $0.ownerUid == id }
    }
}
