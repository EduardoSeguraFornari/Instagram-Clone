//
//  UserServiceProtocol.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

protocol UserServiceProtocol {
    func fetchAllUsers() async throws -> [User]
}
