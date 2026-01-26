//
//  CommentsService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

import Firebase
import FirebaseFirestore

final class CommentsService: CommentsServiceProtocol {
    static var instance: CommentsServiceProtocol {
        if AppConfiguration.useMockServices {
            return CommentsServiceMock()
        }
        return CommentsService()
    }

    func fetchComments(postId: String) async throws -> [Comment] {
        do {
            let snapshot = try await PostService.postsCollection.document(postId).collection("post-comments")
                .order(by: "timestamp", descending: true)
                .getDocuments()
            return snapshot.documents.compactMap { try? $0.data(as: Comment.self) }
        } catch {
            print("DEBUG: Failed to fetch comments with error: \(error.localizedDescription)")
            throw error
        }
    }

    func uploadComment(_ comment: Comment, postId: String) async throws {
        do {
            let commentData = try Firestore.Encoder().encode(comment)
            try await PostService.postsCollection.document(postId).collection("post-comments")
                .addDocument(data: commentData)
        } catch {
            print("DEBUG: Failed to upload comment with error: \(error.localizedDescription)")
            throw error
        }
    }
}
