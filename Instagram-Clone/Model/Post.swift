//
//  Post.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Firebase
import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Timestamp
    var user: User?

    var didLike: Bool? = false
}

extension Post {
    static let mockImageUrl = "https://firebasestorage.googleapis.com:443/v0/b/instagramswiftui-22394.appspot.com/o/profile_images%2FB70FA869-C342-4756-BDC0-C2D1B948F89C?alt=media&token=7a1a94b3-4d15-41d7-9400-1210fa46c681"

    static let postMock = postsMock[0]

    static let postsMock: [Post] = [
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[0].id,
            caption: "Amazing sunset at the beach 🌅 Perfect end to a beautiful day!",
            likes: 142,
            imageUrl: "batman-post",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[1].id,
            caption: "Coffee and code ☕️💻 Starting the day right with some Swift programming!",
            likes: 89,
            imageUrl: "wakanda-forever",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[2].id,
            caption: "Weekend vibes! 🎉 Nothing better than spending time with friends and family.",
            likes: 256,
            imageUrl: "batman-profile",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[3].id,
            caption: "New recipe attempt 🍝 Homemade pasta with fresh basil from the garden!",
            likes: 73,
            imageUrl: "wakanda-forever",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[4].id,
            caption: "Mountain hiking adventure! 🏔️ The view from the top was absolutely breathtaking.",
            likes: 187,
            imageUrl: "batman-post",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[0].id,
            caption: "Late night coding session 🌙 Working on something exciting!",
            likes: 45,
            imageUrl: "wakanda-forever",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[1].id,
            caption: "Fresh flowers from the local market 🌸 Spring is finally here!",
            likes: 312,
            imageUrl: "batman-profile",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[2].id,
            caption: "Book recommendation 📚 Just finished this amazing sci-fi novel!",
            likes: 67,
            imageUrl: "wakanda-forever",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[3].id,
            caption: "City skyline at golden hour ✨ There's something magical about this time of day.",
            likes: 201,
            imageUrl: "batman-post",
            timestamp: Timestamp(),
            user: nil
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[4].id,
            caption: "Weekend project complete! 🔨 Built this wooden shelf from scratch.",
            likes: 134,
            imageUrl: "wakanda-forever",
            timestamp: Timestamp(),
            user: nil
        )
    ]
}
