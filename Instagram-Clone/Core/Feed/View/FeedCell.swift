//
//  FeedCell.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI
import Kingfisher

struct FeedCell: View {
    @State private var showComments = false
    @State private var viewModel: FeedCellViewModel

    private var post: Post {
        viewModel.post
    }

    private var didLike: Bool {
        post.didLike ?? false
    }

    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            // image + username
            HStack {
                if let user = post.user {
                    AvatarView(user: user, size: .xSmall)
                    Text(user.username)
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            .padding(.leading, 8)

            // post image

            KFImage(URL(string: post.imageUrl))
                .onFailureView {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 400)
                        .clipShape(Rectangle())
                        .foregroundStyle(Color(.systemGray4))
                }
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            // action buttons
            HStack(spacing: 16) {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .imageScale(.large)
                        .foregroundStyle(didLike ? .red : .black)
                }
                Button {
                    showComments.toggle()
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }
                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 8)
            .foregroundColor(.black)

            // likes label
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            

            // caption label
            HStack {
                Text(post.user?.username ?? "").fontWeight(.semibold) +
                Text(post.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)

            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
        .sheet(isPresented: $showComments) {
            CommentsView()
                .presentationDragIndicator(.visible)
        }
    }

    private func handleLikeTapped() {
        Task {
            if didLike {
                await viewModel.unlike()
            } else {
                await viewModel.like()
            }
        }
    }
}

#Preview {
    FeedCell(viewModel: FeedCellViewModel(post: Post.postMock, service: PostServiceMock()))
}
