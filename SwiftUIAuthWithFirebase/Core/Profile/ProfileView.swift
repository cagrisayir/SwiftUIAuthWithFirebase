//
//  ProfileView.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import SwiftUI

struct ProfileView: View {
    var user: User = User(id: "1", fullname: "Mich Jordan", email: "Mach@gmail.com")

    var body: some View {
        List {
            Section {
                HStack(alignment: .center) {
                    Text(user.fullname.firstLetters())
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray3))
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 4) {
                        Text(user.fullname)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, 4)

                        Text(user.email)
                            .font(.footnote)
                            .tint(.gray)
                            .foregroundStyle(.gray)
                    }
                }
            }

            Section("General") {
            }

            Section("Account") {
            }
        }
    }
}

struct User {
    var id: String
    var fullname: String
    var email: String
}

#Preview {
    ProfileView()
}
