//
//  DeveloperPreview.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

import Firebase

final class DeveloperPreview {
    static let comment = Comment(
        postOwnerUid: User.usersMock[0].id,
        commentText: "What a post!",
        postID: Post.postsMock[0].id,
        timestamp: Timestamp(),
        commentOwnerUid: UUID().uuidString
    )

    static let commentsMock: [Comment] = [
        Comment(
            postOwnerUid: User.usersMock[0].id,
            commentText: "What a post!",
            postID: Post.postsMock[0].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[1].id
        ),
        Comment(
            postOwnerUid: User.usersMock[1].id,
            commentText: "Amazing shot! 📸",
            postID: Post.postsMock[1].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[2].id
        ),
        Comment(
            postOwnerUid: User.usersMock[2].id,
            commentText: "Love this! 💙",
            postID: Post.postsMock[2].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[3].id
        ),
        Comment(
            postOwnerUid: User.usersMock[3].id,
            commentText: "So cool! Where is this?",
            postID: Post.postsMock[3].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[4].id
        ),
        Comment(
            postOwnerUid: User.usersMock[4].id,
            commentText: "Great content as always! 👏",
            postID: Post.postsMock[4].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[0].id
        ),
        Comment(
            postOwnerUid: User.usersMock[0].id,
            commentText: "This is inspiring! ✨",
            postID: Post.postsMock[5].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[3].id
        ),
        Comment(
            postOwnerUid: User.usersMock[1].id,
            commentText: "Beautiful colors! 🎨",
            postID: Post.postsMock[6].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[4].id
        ),
        Comment(
            postOwnerUid: User.usersMock[2].id,
            commentText: "Can't wait to see more!",
            postID: Post.postsMock[7].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[0].id
        ),
        Comment(
            postOwnerUid: User.usersMock[3].id,
            commentText: "This made my day! 😊",
            postID: Post.postsMock[8].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[1].id
        ),
        Comment(
            postOwnerUid: User.usersMock[4].id,
            commentText: "Incredible work! 🔥",
            postID: Post.postsMock[9].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[2].id
        ),
        Comment(
            postOwnerUid: User.usersMock[1].id,
            commentText: "Perfect timing! ⏰",
            postID: Post.postsMock[0].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[4].id
        ),
        Comment(
            postOwnerUid: User.usersMock[2].id,
            commentText: "So artistic! 🎭",
            postID: Post.postsMock[1].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[3].id
        ),
        Comment(
            postOwnerUid: User.usersMock[0].id,
            commentText: "Goals! 🎯",
            postID: Post.postsMock[3].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[2].id
        ),
        Comment(
            postOwnerUid: User.usersMock[3].id,
            commentText: "Simply stunning! ⭐",
            postID: Post.postsMock[2].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[1].id
        ),
        Comment(
            postOwnerUid: User.usersMock[4].id,
            commentText: "Keep it up! 💪",
            postID: Post.postsMock[4].id,
            timestamp: Timestamp(),
            commentOwnerUid: User.usersMock[0].id
        )
    ]
}
