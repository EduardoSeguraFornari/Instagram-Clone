//
//  AuthServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Firebase
import FirebaseAuth
import FirebaseFirestore

final class AuthServiceMock: AuthServiceProtocol {
    init() {
        Authentication.shared.loggedIn = nil
    }

    func createUser(email: String, password: String, username: String) async throws {
        Authentication.shared.loggedIn = true
        Authentication.shared.user = User(id: UUID().uuidString, username: username, email: email)
    }

    func loadUserData() async throws {
        guard let currentUid = Authentication.shared.user?.id else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(currentUid).getDocument()
        let user = try snapshot.data(as: User.self)
        Authentication.shared.user = user
//        Authentication.shared.user = User.userMock
    }

    func logIn(withEmail email: String, password: String) async throws {
        Authentication.shared.loggedIn = true
        try await loadUserData()
    }

    func signOut() {
        Authentication.shared.loggedIn = nil
    }

    func uploadUserData(email: String, id: String, username: String) async throws { }
}
