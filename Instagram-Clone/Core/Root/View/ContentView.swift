//
//  ContentView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Group {
            if let loggedIn = Authentication.shared.loggedIn, loggedIn,
               let user = Authentication.shared.user {
                MainTabView(user: user)
            } else {
                LoginView(viewModel: LoginViewModel(service: AuthService()))
                    .environment(RegistrationViewModel(service: AuthService()))
            }
        }
    }
}

#Preview {
    ContentView()
}
