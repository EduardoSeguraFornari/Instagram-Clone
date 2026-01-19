//
//  Authentication.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Foundation

@MainActor
@Observable
final class Authentication {
    static let shared = Authentication()
    var loggedIn: Bool?

    private init() { }
}
