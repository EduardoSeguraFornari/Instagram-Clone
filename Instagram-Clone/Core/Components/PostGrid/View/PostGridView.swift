//
//  PostGridView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Kingfisher
import SwiftUI

struct PostGridView: View {
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1

    @State private var viewModel: ProfileViewModel

    init(viewModel: ProfileViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.posts) { post in
                KFImage(URL(string: post.imageUrl))
                    .onFailureView {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .scaledToFill()
                            .frame(width: imageDimension, height: imageDimension)
                            .clipped()
                            .background(.black)
                            .foregroundStyle(.white)
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: imageDimension, height: imageDimension)
                    .clipped()
            }
        }
    }
}

#Preview {
    PostGridView(viewModel: ProfileViewModel(service: PostServiceMock(), user: User.userMock))
}
