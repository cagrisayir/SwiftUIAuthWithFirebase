//
//  AuthViewModel.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import Firebase
import Foundation

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // Firebase Auth user
    @Published var currentUser: User? // Our user

    init() {
    }

    func login(withEmail email: String, password: String) async throws {}

    func createUser(withEmail email: String, password: String, fullname: String) async throws {}

    func signOut() {}

    func deleteAccount() {}

    func fetchUser() async {}
}
