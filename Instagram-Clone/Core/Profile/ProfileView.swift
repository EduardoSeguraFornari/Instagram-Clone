//
//  ProfileView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.dismiss) var dismiss
    let user: User

    var posts: [Post] {
        Post.postsMock.filter { $0.user?.id == user.id }
    }

    var body: some View {
        ScrollView {
            ProfileHeaderView(user: user)
            PostGridView(posts: posts)
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(user: User.userMock)
    }
}
