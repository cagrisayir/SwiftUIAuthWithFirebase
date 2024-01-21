//
//  RegisterView.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: AuthViewModel

    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var confirmPassword = ""

    var body: some View {
        VStack {
            // image
            Image("splash-screen-logo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 220)
                .padding(.vertical, 32)

            // form fields
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name").textInputAutocapitalization(.words)
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
            }
            .textInputAutocapitalization(.never)
            .padding(.horizontal)
            .padding(.top, 12)

            // sign up button
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                    dismiss()
                }
            } label: {
                HStack {
                    Text("Sign Up")
                        .fontWeight(.semibold)
                    Image(systemName: "arrow.right")
                }.foregroundStyle(.white)
                    .frame(width: 300, height: 48)
            }
            .background(Color(.systemBlue))
            .clipShape(.buttonBorder)
            .padding(.top, 24)

            Spacer()

            // sign in button
            Button(action: {
                dismiss()
            }, label: {
                HStack(spacing: 3) {
                    Text("Do you have an account?")
                    Text("Sign In")
                        .fontWeight(.bold)
                }.font(.system(size: 14))
            })
        }
    }
}

#Preview {
    RegisterView()
}
