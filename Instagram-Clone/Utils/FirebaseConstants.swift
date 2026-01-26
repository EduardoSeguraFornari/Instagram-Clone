//
//  FirebaseConstants.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 26/01/26.
//

import Firebase

struct FirebaseConstants {
    static let Root = Firestore.firestore()

    static let postsCollection = Root.collection("posts")
    static let usersCollection = Root.collection("users")
}
