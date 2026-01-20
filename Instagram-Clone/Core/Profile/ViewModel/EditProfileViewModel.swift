//
//  EditProfileViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

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

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
    }
}
