//
//  LoginView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    let viewModel = RegistrationViewModel(service: AuthService())

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()

                // logo image
                Text("Instagram")
                    .font(.custom("Snell Roundhand", size: 40))
                    .fontWeight(.bold)

                // text fields
                VStack {
                    TextField("Enter your email", text: $email)
                        .modifier(TextFieldModifier())
                        .autocapitalization(.none)
                    TextField("Enter your password", text: $password)
                        .modifier(TextFieldModifier())
                }

                Button {
                    print("Show forgot password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.trailing, 20)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                Button {
                    print("Login")
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .containerRelativeFrame(.horizontal) { length, _ in length-(2*16) }
                        .frame(height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)

                HStack {
                    Rectangle()
                        .containerRelativeFrame(.horizontal) { length, _ in (length/2)-40 }
                        .frame(height: 0.5)
                    Text("OR")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .containerRelativeFrame(.horizontal) { length, _ in (length/2)-40 }
                        .frame(height: 0.5)
                }
                .foregroundStyle(.gray)

                HStack {
                    Image("facebook-logo")
                        .resizable()
                        .frame(width: 20, height: 20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemBlue))
                }
                .padding(.top, 8)

                Spacer()

                Divider()

                NavigationLink {
                    AddEmailView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
