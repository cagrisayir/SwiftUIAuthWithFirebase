//
//  LoginView.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        GeometryReader { geo in
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
                        print("Log user in")
                    } label: {
                        HStack {
                            Text("Sign In")
                                .fontWeight(.semibold)
                            Image(systemName: "arrow.right")
                        }.foregroundStyle(.white)
                            .frame(width: geo.size.width - 32, height: 48)
                    }
                    .background(Color(.systemBlue))
                    .clipShape(.buttonBorder)
                    .padding(.top, 24)

                    Spacer()
                    // sign up button
                    NavigationLink {
                        // RegisterView()
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
}

#Preview {
    LoginView()
}
