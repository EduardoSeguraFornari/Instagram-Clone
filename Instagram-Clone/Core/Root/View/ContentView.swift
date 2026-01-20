//
//  ContentView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct ContentView: View {
    let service: AuthServiceProtocol

    @State private var registrationViewModel: RegistrationViewModel

    init(service: AuthServiceProtocol) {
        self.service = service
        self.registrationViewModel = RegistrationViewModel(service: service)
    }

    var body: some View {
        Group {
            if let loggedIn = Authentication.shared.loggedIn, loggedIn,
               Authentication.shared.user != nil {
                MainTabView(user: User.userMock)
            } else {
                LoginView(viewModel: LoginViewModel(service: service))
                    .environment(registrationViewModel)
            }
        }
    }
}

#Preview {
    ContentView(service: AuthServiceMock())
}
