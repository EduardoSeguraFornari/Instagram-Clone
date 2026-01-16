//
//  CreateUsernameView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct CreateUsernameView: View {
    @Environment(\.dismiss) var dismiss
    @State private var username: String = ""

    var body: some View {
        VStack(spacing: 12) {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("Pick a username for your account. You can always change it later")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            TextField("Username", text: $username)
                .modifier(TextFieldModifier())
                .autocapitalization(.none)
                .padding(.top)

            NavigationLink {
                CreatePasswordView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .containerRelativeFrame(.horizontal) { length, _ in length-(2*16) }
                    .frame(height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        CreateUsernameView()
    }
}
