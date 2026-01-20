//
//  AuthService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import FirebaseAuth
import FirebaseFirestore

final class AuthService: AuthServiceProtocol {

    static let shared = AuthService()

    init() {
        Authentication.shared.loggedIn = Auth.auth().currentUser != nil
    }

    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            Authentication.shared.loggedIn = true
            try await uploadUserData(email: email, id: result.user.uid, username: username)
        } catch {
            print("DEBUG: Failed to register user with error: \(error.localizedDescription)")
            throw error
        }
    }

    func loadUserData() async throws {
        
    }

    func logIn(withEmail email: String, password: String) async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            Authentication.shared.loggedIn = true
        } catch {
            print("DEBUG: Failed to log in with error: \(error.localizedDescription)")
            throw error
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        Authentication.shared.loggedIn = false
    }

    func uploadUserData(email: String, id: String, username: String) async throws {
        let user = User(id: id, username: username, email: email)
        do {
            let data = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(id).setData(data)
        } catch {
            print("DEBUG: Failed to upload user data with error: \(error.localizedDescription)")
            throw error
        }
    }
}
