//
//  User.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String

    // another way for firstletters instead of extension
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }

        // You can use placeholder image
        return ""
    }
}

extension User {
    static var MOCK_USER = User(id: UUID().uuidString, fullname: "Omer Cagri", email: "omercagris@gmail.com")
}
