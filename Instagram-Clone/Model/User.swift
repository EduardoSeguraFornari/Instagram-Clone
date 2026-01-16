//
//  User.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var username: String
    var fullname: String?
    var profileImage: String?
    var bio: String?
    let email: String
}

extension User {
    static var usersMock: [User] = [
        .init(id: UUID().uuidString, username: "batman", fullname: "Bruce Wayne", profileImage: "batman-profile", bio: "I am Batman", email: "batman@test.com"),
        .init(id: UUID().uuidString, username: "joao", fullname: "Jõao", profileImage: "wakanda-forever", bio: "I am João", email: "joao@test.com"),
        .init(id: UUID().uuidString, username: "maria", fullname: "Maria", profileImage: "batman-post", bio: "I am Maria", email: "maria@test.com"),
        .init(id: UUID().uuidString, username: "eduardo", fullname: "Eduardo", profileImage: "batman-profile", bio: "I am Eduardo", email: "eduardo@test.com"),
        .init(id: UUID().uuidString, username: "monica", fullname: "Mônica", profileImage: "wakanda-forever", bio: "I am Monica", email: "monica@test.com")
    ]
}
