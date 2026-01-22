//
//  CommentsView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

import SwiftUI

struct CommentsView: View {
    @State private var text: String = ""
    @State private var viewModel: CommentsViewModel

    init(viewModel: CommentsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.semibold)
                .padding(.top, 24)
            Divider()

            ScrollView {
                LazyVStack(spacing: 24) {
                    ForEach(0...15, id: \.self) { comment in
                        CommentCell(user: User.userMock)
                    }
                }
            }
            .padding(.top)

            Divider()

            HStack(spacing: 12) {
                AvatarView(user: User.userMock, size: .xSmall)
                ZStack(alignment: .trailing) {
                    TextField("Add a comment...", text: $text, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        }
                    Button {
                        Task { await viewModel.ulploadComment(commentText: text) }
                    } label: {
                        Text("Post")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color(.systemBlue))
                    }
                    .padding(.horizontal)
                }
            }
            .padding()
        }
    }
}

#Preview {
    CommentsView(viewModel: CommentsViewModel(post: Post.postMock, service: CommentsServiceMock()))
}
