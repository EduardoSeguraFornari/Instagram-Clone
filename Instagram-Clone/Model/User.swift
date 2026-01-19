//
//  User.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import Foundation

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var fullname: String?
    var profileImageUrl: String?
    var bio: String?
    let email: String
}

extension User {
    static var userMock: User = User.usersMock[0]
    static var usersMock: [User] = [
        .init(id: UUID().uuidString, username: "batman", fullname: "Bruce Wayne", profileImageUrl: "batman-profile", bio: "I am Batman", email: "batman@test.com"),
        .init(id: UUID().uuidString, username: "joao", fullname: "João", profileImageUrl: "wakanda-forever", bio: "I am João", email: "joao@test.com"),
        .init(id: UUID().uuidString, username: "maria", fullname: "Maria", profileImageUrl: "batman-post", bio: "I am Maria", email: "maria@test.com"),
        .init(id: UUID().uuidString, username: "eduardo", fullname: "Eduardo", profileImageUrl: "batman-profile", bio: "I am Eduardo", email: "eduardo@test.com"),
        .init(id: UUID().uuidString, username: "monica", fullname: "Mônica", profileImageUrl: "wakanda-forever", bio: "I am Monica", email: "monica@test.com")
    ]
}
