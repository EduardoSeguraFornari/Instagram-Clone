//
//  CommentCell.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

import SwiftUI

struct CommentCell: View {
    private let comment: Comment
    private var user: User? {
        comment.user
    }

    init(comment: Comment) {
        self.comment = comment
    }

    var body: some View {
        HStack {
            AvatarView(user: comment.user, size: .xSmall)

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 2) {
                    Text(user?.username ?? "")
                        .fontWeight(.semibold)
                    Text(comment.timestamp.timestampString)
                        .foregroundStyle(.black)
                }
                Text(comment.commentText)
            }
            .font(.caption)

            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    CommentCell(comment: DeveloperPreview.comment)
}
