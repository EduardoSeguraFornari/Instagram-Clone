//
//  ContentView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct ContentView: View {
//    @State var viewModel = ContentViewModel()
    @State var registrationViewModel = RegistrationViewModel(service: AuthServiceMock())

    var body: some View {
        Group {
            if let loggedIn = Authentication.shared.loggedIn, loggedIn {
                MainTabView()
            } else {
                LoginView(viewModel: LoginViewModel(service: AuthServiceMock()))
                    .environment(registrationViewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
