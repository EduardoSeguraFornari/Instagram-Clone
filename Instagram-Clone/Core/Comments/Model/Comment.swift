//
//  Comment.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 22/01/26.
//

import Firebase
import FirebaseFirestore

struct Comment: Identifiable, Codable {
    @DocumentID var commentID: String?
    let postOwnerUid: String
    let commentText: String
    let postID: String
    let timestamp: Timestamp
    let commentOwnerUid: String

    var user: User?

    var id: String {
        commentID ?? NSUUID().uuidString
    }
}
