//
//  LoginView.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    @State var email = ""
    @State var password = ""

    var body: some View {
        NavigationStack {
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

                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .textInputAutocapitalization(.never)
                .padding(.horizontal)
                .padding(.top, 12)

                // sign in button
                Button {
                    Task {
                        try await viewModel.login(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("Sign In")
                            .fontWeight(.semibold)
                        Image(systemName: "arrow.right")
                    }.foregroundStyle(.white)
                        .frame(width: 300, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .clipShape(.buttonBorder)
                .padding(.top, 24)

                Spacer()
                // sign up button
                NavigationLink {
                    RegisterView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }.font(.system(size: 14))
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
