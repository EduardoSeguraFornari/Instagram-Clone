//
//  UserService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Firebase
import FirebaseFirestore

struct UserService: UserServiceProtocol {
    static var instance: UserServiceProtocol {
        if AppConfiguration.useMockServices {
            return UserServiceMock()
        }
        return UserService()
    }
    static let usersCollection = Firestore.firestore().collection("users")

    private let imageUploaderService: ImageUploaderServiceProtocol

    init (imageUploaderService: ImageUploaderServiceProtocol = ImageUploaderService()) {
        self.imageUploaderService = imageUploaderService
    }

    func fetchAllUsers() async throws -> [User] {
        do {
            let snapshot = try await UserService.usersCollection.getDocuments()
            return snapshot.documents.compactMap { try? $0.data(as: User.self) }
        } catch {
            throw error
        }
    }

    func fetchUser(withId id: String) async throws -> User {
        do {
            return try await UserService.usersCollection.document(id).getDocument(as: User.self)
        } catch {
            print("DEBUG: Failed to fetch user with error: \(error.localizedDescription)")
            throw error
        }
    }

    func updateUserData(bio: String?, fullname: String?, image: UIImage?) async throws {
        guard let currentUser = Authentication.shared.user else { return }

        do {
            var data = [String: Any]()

            if let uiImage = image {
                let imageUrl = try? await imageUploaderService.upload(image: uiImage)
                data["profileImageUrl"] = imageUrl
            }
            if let fullname = fullname, !fullname.isEmpty && currentUser.fullname != fullname {
                data["fullname"] = fullname
            }
            if currentUser.bio != bio {
                data["bio"] = bio ?? ""
            }
            if !data.isEmpty {
                try await UserService.usersCollection.document(currentUser.id).updateData(data)
            }
        } catch {
            print("DEBUG: Failed to update user data with error: \(error.localizedDescription)")
        }
    }

    func uploadUserData(email: String, id: String, username: String) async throws {
        let user = User(id: id, username: username, email: email)
        do {
            let data = try Firestore.Encoder().encode(user)
            try await UserService.usersCollection.document(id).setData(data)
        } catch {
            print("DEBUG: Failed to upload user data with error: \(error.localizedDescription)")
            throw error
        }
    }
}
