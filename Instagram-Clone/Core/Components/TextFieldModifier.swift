//
//  TextFieldModifier.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
