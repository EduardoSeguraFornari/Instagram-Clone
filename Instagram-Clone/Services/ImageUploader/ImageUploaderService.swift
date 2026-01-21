//
//  ImageUploaderService.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploaderService: ImageUploaderServiceProtocol {
    static var instance: ImageUploaderServiceProtocol {
        if AppConfiguration.useMockServices {
            return ImageUploaderServiceMock()
        }
        return ImageUploaderService()
    }

    func upload(image: UIImage) async throws -> String? {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return nil }
        let fileName = UUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")

        do {
            let _ = try await ref.putDataAsync(imageData)
            let url = try await ref.downloadURL()
            return url.absoluteString
        } catch {
            print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            return nil
        }
    }
}
