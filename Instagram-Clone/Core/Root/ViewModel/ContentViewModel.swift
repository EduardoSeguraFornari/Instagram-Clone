//
//  ContentViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Combine
import Firebase

@Observable
final class ContentViewModel {
    var loggedIn: Bool? { Authentication.shared.loggedIn }

//    private let service = AutAuthService.shared

    init() {
    }
}
