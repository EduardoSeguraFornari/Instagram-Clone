//
//  PostService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

import Firebase
import FirebaseFirestore

final class PostService: PostServiceProtocol {
    private let postsCollection = Firestore.firestore().collection("posts")
    private let userService: UserServiceProtocol

    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }

    func fetchPosts() async throws -> [Post] {
        do {
            let snapshot = try await postsCollection.getDocuments()
            var posts = snapshot.documents.compactMap { try? $0.data(as: Post.self) }

            for index in posts.indices {
                let post = posts[index]
                let ownerUid = post.ownerUid
                posts[index].user = try await userService.fetchUser(withId: ownerUid)
            }

            return posts
        } catch {
            print("DEBUG: Failed to fetch posts with error: \(error.localizedDescription)")
            throw error
        }
    }

    func fetchUserPosts(id: String) async throws -> [Post] {
        let query = try await postsCollection.whereField("ownerUid", isEqualTo: id).getDocuments()
        var posts = query.documents.compactMap { try? $0.data(as: Post.self) }

        for index in posts.indices {
            let post = posts[index]
            let ownerUid = post.ownerUid
            if id == Authentication.shared.user?.id {
                posts[index].user = Authentication.shared.user
            } else {
                posts[index].user = try await userService.fetchUser(withId: ownerUid)
            }
        }

        return posts
    }
}
