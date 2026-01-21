//
//  CurrentUserProfileView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User

    var body: some View {
        NavigationStack {
            ScrollView {
                ProfileHeaderView(user: user)
                PostGridView(viewModel: ProfileViewModel(service: PostService(), user: user))
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        AuthService().signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(user: User.userMock)
}
