//
//  ImageUploaderServiceMock.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import Firebase
import FirebaseStorage
import UIKit

struct ImageUploaderServiceMock: ImageUploaderServiceProtocol {
    func upload(image: UIImage) async throws -> String? {
        ""
    }
}
