//
//  PostService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

final class PostService: PostServiceProtocol {
    static var instance: PostServiceProtocol {
        if AppConfiguration.useMockServices {
            return PostServiceMock()
        }
        return PostService()
    }

    private let userService: UserServiceProtocol

    init(userService: UserServiceProtocol = UserService.instance) {
        self.userService = userService
    }

    func fetchPosts() async throws -> [Post] {
        do {
            let snapshot = try await FirebaseConstants.postsCollection.getDocuments()
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
        do {
            let query = try await FirebaseConstants.postsCollection.whereField("ownerUid", isEqualTo: id).getDocuments()
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
        } catch {
            print("DEBUG: Failed fetch user posts with error: \(error.localizedDescription)")
            throw error
        }
    }
}

// MARK: - Likes

extension PostService {
    func checkIfUserLikedPost(_ post: Post) async throws -> Bool {
        guard let currentUserId = Authentication.shared.user?.id else { return false }
        do {
            let snapshot = try await FirebaseConstants.usersCollection.document(currentUserId).collection("user-likes")
                .document(post.id).getDocument()
            return snapshot.exists
        } catch {
            print("DEBUG: Failed to check if user liked post with error: \(error.localizedDescription)")
            throw error
        }
    }

    func likePost(_ post: Post) async throws {
        do {
            guard let currentUserId = Authentication.shared.user?.id else { return }
            async let _ = try await FirebaseConstants.postsCollection.document(post.id).collection("post-likes")
                .document(currentUserId).setData([:])
            async let _ = try await FirebaseConstants.postsCollection.document(post.id).updateData(["likes": post.likes + 1])
            async let _ = FirebaseConstants.usersCollection.document(currentUserId).collection("user-likes").document(post.id).setData([:])
        } catch {
            print("DEBUG: Failed like post with error: \(error.localizedDescription)")
            throw error
        }
    }

    func unlikePost(_ post: Post) async throws {
        do {
            guard let currentUserId = Authentication.shared.user?.id else { return }
            async let _ = try await FirebaseConstants.postsCollection.document(post.id).collection("post-likes")
                .document(currentUserId).delete()
            async let _ = try await FirebaseConstants.postsCollection.document(post.id).updateData(["likes": post.likes - 1])
            async let _ = FirebaseConstants.usersCollection.document(currentUserId).collection("user-likes")
                .document(post.id).delete()
        } catch {
            print("DEBUG: Failed unlike post with error: \(error.localizedDescription)")
            throw error
        }
    }
}
