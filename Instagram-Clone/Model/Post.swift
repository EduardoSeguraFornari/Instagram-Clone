//
//  Post.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static let postMock = postsMock[0]

    static let postsMock: [Post] = [
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[0].id,
            caption: "Amazing sunset at the beach 🌅 Perfect end to a beautiful day!",
            likes: 142,
            imageUrl: "batman-post",
            timestamp: Date().addingTimeInterval(-3600), // 1 hour ago
            user: User.usersMock[0]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[1].id,
            caption: "Coffee and code ☕️💻 Starting the day right with some Swift programming!",
            likes: 89,
            imageUrl: "wakanda-forever",
            timestamp: Date().addingTimeInterval(-7200), // 2 hours ago
            user: User.usersMock[1]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[2].id,
            caption: "Weekend vibes! 🎉 Nothing better than spending time with friends and family.",
            likes: 256,
            imageUrl: "batman-profile",
            timestamp: Date().addingTimeInterval(-14400), // 4 hours ago
            user: User.usersMock[2]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[3].id,
            caption: "New recipe attempt 🍝 Homemade pasta with fresh basil from the garden!",
            likes: 73,
            imageUrl: "wakanda-forever",
            timestamp: Date().addingTimeInterval(-21600), // 6 hours ago
            user: User.usersMock[3]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[4].id,
            caption: "Mountain hiking adventure! 🏔️ The view from the top was absolutely breathtaking.",
            likes: 187,
            imageUrl: "batman-post",
            timestamp: Date().addingTimeInterval(-86400), // 1 day ago
            user: User.usersMock[4]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[0].id,
            caption: "Late night coding session 🌙 Working on something exciting!",
            likes: 45,
            imageUrl: "wakanda-forever",
            timestamp: Date().addingTimeInterval(-172800), // 2 days ago
            user: User.usersMock[0]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[1].id,
            caption: "Fresh flowers from the local market 🌸 Spring is finally here!",
            likes: 312,
            imageUrl: "batman-profile",
            timestamp: Date().addingTimeInterval(-259200), // 3 days ago
            user: User.usersMock[1]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[2].id,
            caption: "Book recommendation 📚 Just finished this amazing sci-fi novel!",
            likes: 67,
            imageUrl: "wakanda-forever",
            timestamp: Date().addingTimeInterval(-345600), // 4 days ago
            user: User.usersMock[2]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[3].id,
            caption: "City skyline at golden hour ✨ There's something magical about this time of day.",
            likes: 201,
            imageUrl: "batman-post",
            timestamp: Date().addingTimeInterval(-432000), // 5 days ago
            user: User.usersMock[3]
        ),
        Post(
            id: UUID().uuidString,
            ownerUid: User.usersMock[4].id,
            caption: "Weekend project complete! 🔨 Built this wooden shelf from scratch.",
            likes: 134,
            imageUrl: "wakanda-forever",
            timestamp: Date().addingTimeInterval(-518400), // 6 days ago
            user: User.usersMock[4]
        )
    ]
}
