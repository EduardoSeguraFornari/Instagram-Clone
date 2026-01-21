//
//  PostServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

final class PostServiceMock: PostServiceProtocol {
    func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        true
    }

    func fetchPosts() async throws -> [Post] {
        Post.postsMock
    }

    func fetchUserPosts(id: String) async throws -> [Post] {
        Post.postsMock.filter { $0.ownerUid == id }
    }

    func likePost(_ post: Post) async throws { }

    func unlikePost(_ post: Post) async throws { }
}
