//
//  AvatarView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Kingfisher
import SwiftUI

struct AvatarView: View {
    let user: User?
    let size: AvatarSize

    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .onFailureView {
                    Image(systemName: "person.circle.fill")
                        .circularImage(size: size)
                }
                .circularImage(size: size)
        } else {
            Image(systemName: "person.circle.fill")
                .circularImage(size: size)
        }
    }
}

#Preview {
    VStack {
        AvatarView(user: User.userMock, size: .xLarge)
        AvatarView(user: User.userMock, size: .large)
        AvatarView(user: User.userMock, size: .medium)
        AvatarView(user: User.userMock, size: .small)
        AvatarView(user: User.userMock, size: .xSmall)
        AvatarView(user: User.userMock, size: .xxSmall)
    }
}
