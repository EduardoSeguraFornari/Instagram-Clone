//
//  AvatarViewModifier.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import SwiftUI
import Kingfisher

extension Image {
    func circularImage(size: AvatarSize) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: size.dimention, height: size.dimention)
            .clipShape(Circle())
            .foregroundStyle(Color(.systemGray4))
    }
}

extension KFImage {
    func circularImage(size: AvatarSize) -> some View {
        self
            .resizable()
            .scaledToFill()
            .frame(width: size.dimention, height: size.dimention)
            .clipShape(Circle())
    }
}
