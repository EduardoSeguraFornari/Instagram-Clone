//
//  CompleteSignUpView.swift
//  Instagram-Clone
//
//  Created by Eduardo Segura Fornari on 16/01/26.
//

import SwiftUI

struct CompleteSignUpView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email: String = ""

    var body: some View {
        VStack(spacing: 12) {
            Spacer()

            Text("Welcome to Instagram, batman")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
                .multilineTextAlignment(.center)

            Text("Click below to complete registration ans start using Instagram")
                .font(.footnote)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)

            Button {
                print("Complete Sign Up")
            } label: {
                Text("Complete Sign Up")
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
        CompleteSignUpView()
    }
}
