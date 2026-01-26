//
//  UploadPostViewModel.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import Firebase
import FirebaseFirestore
import PhotosUI
import SwiftUI

@MainActor
@Observable
final class UploadPostViewModel {
    var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    var postImage: Image?

    private let service: ImageUploaderServiceProtocol
    private var uiImage: UIImage?

    init(service: ImageUploaderServiceProtocol) {
        self.service = service
    }

    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }

    func uploadPost(caption: String) async {
        guard let ownerUid = Authentication.shared.user?.id else { return }
        guard let uiImage = uiImage else { return }
        let postRef = FirebaseConstants.postsCollection.document()

        do {
            guard let imageUrl = try await service.upload(image: uiImage) else { return }
            let post = Post(id: postRef.documentID, ownerUid: ownerUid, caption: caption, likes: 0, imageUrl: imageUrl, timestamp: Timestamp())
            let encodedPost = try Firestore.Encoder().encode(post)
            try await postRef.setData(encodedPost)
        } catch {
            print("DEBUG: Failed to upload post with error: \(error.localizedDescription)")
        }
    }
}
