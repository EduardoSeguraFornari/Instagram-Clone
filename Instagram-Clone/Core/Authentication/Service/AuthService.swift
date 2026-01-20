//
//  AuthService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import FirebaseAuth

final class AuthService: AuthServiceProtocol {

    static let shared = AuthService()

    init() {
        Authentication.shared.loggedIn = Auth.auth().currentUser != nil
    }

    func createUser(email: String, password: String, username: String) async throws {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
            Authentication.shared.loggedIn = true
        } catch {
            print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
        }
    }

    func loadUserData() async throws {
        
    }

    func login(withEmail email: String, password: String) async throws {
        
    }

    func signOut() {
        
    }
}
