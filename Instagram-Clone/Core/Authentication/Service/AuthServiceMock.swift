//
//  AuthServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import FirebaseAuth

final class AuthServiceMock: AuthServiceProtocol {
    init() {
        Authentication.shared.loggedIn = nil
    }

    func createUser(email: String, password: String, username: String) async throws {
        Authentication.shared.loggedIn = true
        Authentication.shared.user = User(id: UUID().uuidString, username: username, email: email)
    }

    func loadUserData() async throws {
        Authentication.shared.user = User.userMock
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
