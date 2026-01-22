//
//  CommentCell.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

import SwiftUI

struct CommentCell: View {
    private let user: User

    init(user: User) {
        self.user = user
    }

    var body: some View {
        HStack {
            AvatarView(user: user, size: .xSmall)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user.username)
                        .fontWeight(.semibold)
                    Text("6d")
                        .foregroundStyle(.black)
                }
                Text("Look at this amazing photo!")
            }
            .font(.caption)

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentCell(user: User.userMock)
}
