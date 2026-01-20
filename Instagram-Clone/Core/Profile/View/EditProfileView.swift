//
//  EditProfileView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 20/01/26.
//

import PhotosUI
import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss

    @State private var viewModel = EditProfileViewModel()

    var body: some View {
        VStack {
            VStack {
                HStack {
                    Button("Cancel") {
                        dismiss()
                    }
                    Spacer()
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Button {
                        print("Update profile info")
                    } label: {
                        Text("Done")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.horizontal)

                Divider()
            }

            PhotosPicker(selection: $viewModel.selectedImage) {
                VStack {
                    (viewModel.profileImage ?? Image(systemName: "person"))
                        .resizable()
                        .foregroundStyle(.white)
                        .background(.gray)
                        .clipShape(Circle())
                        .frame(width: 80, height: 80)

                    Text("Edit profile picture")
                        .font(.footnote)
                        .fontWeight(.semibold)

                    Divider()
                }
            }
            .padding(.vertical, 8)

            VStack {
                EditProfileRowView(title: "Name", placeholder: "Enter your name", text: $viewModel.fullname)
                EditProfileRowView(title: "Bio", placeholder: "Enter your bio", text: $viewModel.bio)
            }

            Spacer()
        }
    }
}

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String

    var body: some View {
        HStack {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)

            VStack {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
        .font(.subheadline)
        .frame(height: 36)
    }
}

#Preview {
    EditProfileView()
}
