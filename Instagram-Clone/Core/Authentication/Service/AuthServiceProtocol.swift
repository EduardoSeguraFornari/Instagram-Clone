//
//  AuthServiceProtocol.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Foundation

protocol AuthServiceProtocol {
    func createUser(email: String, password: String, username: String) async throws
    func loadUserData() async throws
    func login(withEmail email: String, password: String) async throws
    func signOut()
}
