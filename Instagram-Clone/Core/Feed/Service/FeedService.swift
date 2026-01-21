//
//  FeedService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 21/01/26.
//

import Firebase
import FirebaseFirestore

final class FeedService: FeedServiceProtocol {
    func fetchPosts() async throws -> [Post] {
        do {
            let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
            return snapshot.documents.compactMap { try? $0.data(as: Post.self) }
        } catch {
            print("DEBUG: Failed to fetch posts with error: \(error.localizedDescription)")
            throw error
        }
    }
}
