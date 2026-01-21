//
//  AuthService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import FirebaseAuth
import FirebaseFirestore

final class AuthService: AuthServiceProtocol {
    private let userService: UserServiceProtocol

    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
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
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        do {
            Authentication.shared.user = try await userService.fetchUser(withId: currentUid)
        } catch {
            print("DEBUG: Failed to load user data with error: \(error.localizedDescription)")
            throw error
        }
    }

    func logIn(withEmail email: String, password: String) async throws {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
            Authentication.shared.loggedIn = true
            try await loadUserData()
        } catch {
            print("DEBUG: Failed to log in with error: \(error.localizedDescription)")
            throw error
        }
    }

    func signOut() {
        try? Auth.auth().signOut()
        Authentication.shared.loggedIn = nil
        Authentication.shared.user = nil
    }

    func uploadUserData(email: String, id: String, username: String) async throws {
        let user = User(id: id, username: username, email: email)
        do {
            try await userService.uploadUserData(email: email, id: id, username: username)
            Authentication.shared.user = user
        } catch {
            print("DEBUG: Failed to upload user data with error: \(error.localizedDescription)")
            throw error
        }
    }
}
