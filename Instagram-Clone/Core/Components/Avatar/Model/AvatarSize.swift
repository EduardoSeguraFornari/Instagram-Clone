//
//  AvatarSize.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Foundation

enum AvatarSize {
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge

    var dimention: CGFloat {
        switch self {
        case .xxSmall: 28
        case .xSmall: 36
        case .small: 40
        case .medium: 48
        case .large: 64
        case .xLarge: 80
        }
    }
}
