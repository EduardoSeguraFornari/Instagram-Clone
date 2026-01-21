//
//  UploadPostView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 19/01/26.
//

import SwiftUI
import PhotosUI

struct UploadPostView: View {
    @State private var caption: String = ""
    @State private var imagePickerPresented = false
    @Binding private var tabIndex: Int
    @State private var viewModel: UploadPostViewModel

    init(tabIndex: Binding<Int>, viewModel: UploadPostViewModel) {
        self._tabIndex = tabIndex
        self._viewModel = State(initialValue: viewModel)
    }

    var body: some View {
        VStack {
            // action tool bar
            HStack {
                Button {
                    clearPostDataAndReturnToFeed()
                } label: {
                    Text("Cancel")
                }

                Spacer()

                Text("New Post")
                    .fontWeight(.semibold)

                Spacer()

                Button {
                    Task {
                        await viewModel.uploadPost(caption: caption)
                        clearPostDataAndReturnToFeed()
                    }
                } label: {
                    Text("Upload")
                        .fontWeight(.semibold)
                }
            }
            .padding(.horizontal)
            // post image and caption
            HStack(spacing: 8) {
                if let image = viewModel.postImage {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipped()
                }
                TextField("Enter your caption", text: $caption, axis: .vertical)
            }
            .padding()

            Spacer()
        }
        .onAppear {
            imagePickerPresented.toggle()
        }
        .photosPicker(isPresented: $imagePickerPresented, selection: $viewModel.selectedImage)
    }

    private func clearPostDataAndReturnToFeed() {
        caption = ""
        viewModel.selectedImage = nil
        viewModel.postImage = nil
        tabIndex = 0
    }
}

#Preview {
    UploadPostView(tabIndex: .constant(0), viewModel: UploadPostViewModel(service: ImageUploaderServiceMock()))
}
