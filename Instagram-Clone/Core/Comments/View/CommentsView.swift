//
//  CommentsView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

import SwiftUI

struct CommentsView: View {
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
                    ForEach(viewModel.comments) { comment in
                        CommentCell(comment: comment)
                    }
                }
            }
            .padding(.top)

            Divider()

            HStack(spacing: 12) {
                AvatarView(user: Authentication.shared.user, size: .xSmall)
                ZStack(alignment: .trailing) {
                    TextField("Add a comment...", text: $viewModel.text, axis: .vertical)
                        .font(.footnote)
                        .padding(12)
                        .padding(.trailing, 40)
                        .overlay {
                            Capsule()
                                .stroke(Color(.systemGray5), lineWidth: 1)
                        }
                    Button {
                        Task { await viewModel.uploadComment() }
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
        .task {
            await viewModel.fetchComments()
        }
    }
}

#Preview {
    CommentsView(viewModel: CommentsViewModel(post: Post.postMock, service: CommentsServiceMock()))
}
