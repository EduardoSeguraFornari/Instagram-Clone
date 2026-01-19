//
//  FeedCellViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Foundation

@Observable
final class FeedCellViewModel {
    var post: Post

    init(post: Post) {
        self.post = post
    }

    func like() async {
        post.didLike = true
        post.likes += 1
    }

    func unlike() async {
        post.didLike = false
        post.likes -= 1
    }
}
