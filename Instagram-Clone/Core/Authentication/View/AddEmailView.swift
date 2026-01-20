//
//  AddEmailView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(RegistrationViewModel.self) var viewModel

    var body: some View {
        @Bindable var bindableViewModel = viewModel
        VStack(spacing: 12) {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            TextField("Email", text: $bindableViewModel.email)
                .modifier(TextFieldModifier())
                .autocapitalization(.none)
                .padding(.top)

            NavigationLink {
                CreateUsernameView()
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
        AddEmailView()
            .environment(RegistrationViewModel(service: AuthServiceMock()))
    }
}
