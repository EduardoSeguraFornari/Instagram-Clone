//
//  RegistrationViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Foundation

@Observable
final class RegistrationViewModel {
    var email = ""
    var password = ""
    var username = ""

    private let service: AuthServiceProtocol

    init(service: AuthServiceProtocol) {
        self.service = service
    }

    func createUser() async throws {
        try await service.createUser(email: email, password: password, username: username)
        email = ""
        password = ""
        username = ""
    }
}
