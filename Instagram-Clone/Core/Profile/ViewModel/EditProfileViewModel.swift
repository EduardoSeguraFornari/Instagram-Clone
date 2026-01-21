//
//  EditProfileViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Firebase
import PhotosUI
import SwiftUI

@MainActor
@Observable
final class EditProfileViewModel {
    var bio = ""
    var fullname = ""
    var profileImage: Image?
    var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    var user: User

    private let service: UserServiceProtocol
    private var uiImage: UIImage?

    init(user: User, service: UserServiceProtocol) {
        self.user = user
        self.service = service

        self.bio = user.bio ?? ""
        self.fullname = user.fullname ?? ""
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    }

    func updateUserData() async {
        do {
            try await service.updateUserData(bio: bio, fullname: fullname, image: uiImage)
        } catch {
            print("DEBUG: Failed to update user data with error: \(error.localizedDescription)")
        }
    }
}
