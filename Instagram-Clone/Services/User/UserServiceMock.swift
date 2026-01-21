//
//  UserServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Foundation

struct UserServiceMock: UserServiceProtocol {
    func fetchAllUsers() async throws -> [User] {
        User.usersMock
    }

    func fetchUser(withId: String) async throws -> User {
        User.userMock
    }

    func uploadUserData(email: String, id: String, username: String) async throws { }

}
