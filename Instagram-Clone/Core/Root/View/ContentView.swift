//
//  ContentView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel = RegistrationViewModel(service: AuthServiceMock())

    var body: some View {
        Group {
            if Authentication.shared.loggedIn != nil {
                MainTabView()
            } else {
                LoginView()
                    .environment(viewModel)
            }
        }
    }
}

#Preview {
    ContentView()
}
