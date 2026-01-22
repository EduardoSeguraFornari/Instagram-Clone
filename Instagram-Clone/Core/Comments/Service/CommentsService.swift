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

    func ulploadComment(_ comment: Comment, postId: String) async throws {
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
