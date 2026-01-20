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
}
