//
//  AuthServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import FirebaseAuth

final class AuthServiceMock: AuthServiceProtocol {

    static let shared = AutAuthService()

    init() {
        Authentication.shared.loggedIn = nil
    }

    func createUser(email: String, password: String, username: String) async throws {
        Authentication.shared.loggedIn = true
    }

    func loadUserData() async throws { }

    func login(withEmail email: String, password: String) async throws {
        Authentication.shared.loggedIn = true
    }

    func signOut() {
        Authentication.shared.loggedIn = nil
    }
}
