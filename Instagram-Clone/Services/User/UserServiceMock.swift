//
//  UserServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import UIKit

struct UserServiceMock: UserServiceProtocol {
    func fetchAllUsers() async throws -> [User] {
        User.usersMock
    }

    func fetchUser(withId: String) async throws -> User {
        User.userMock
    }

    func updateUserData(bio: String?, fullname: String?, image: UIImage?) async throws { }

    func uploadUserData(email: String, id: String, username: String) async throws { }
}
