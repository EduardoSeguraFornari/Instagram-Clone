//
//  UserService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Firebase
import FirebaseFirestore

struct UserService: UserServiceProtocol {
    func fetchAllUsers() async throws -> [User] {
        do {
            let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            return snapshot.documents.compactMap { try? $0.data(as: User.self) }
        } catch {
            throw error
        }
    }
}
