//
//  LoginViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Foundation

@Observable
final class LoginViewModel {
    var email = ""
    var password = ""

    private let service: AuthServiceProtocol

    init(service: AuthServiceProtocol) {
        self.service = service
    }

    func signIn() async {
        do {
            try await service.logIn(withEmail: email, password: password)
        } catch {
            print("DEBUG: Failed to log in with error: \(error.localizedDescription)")
        }
    }
}
