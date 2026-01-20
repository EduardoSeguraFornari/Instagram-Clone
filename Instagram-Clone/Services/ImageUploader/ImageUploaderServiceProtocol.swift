//
//  ImageUploaderProtocol.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import UIKit

protocol ImageUploaderServiceProtocol {
    func upload(image: UIImage) async throws -> String?
}
