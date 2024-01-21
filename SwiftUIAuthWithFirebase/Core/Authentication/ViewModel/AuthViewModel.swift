//
//  AuthViewModel.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import Firebase
import FirebaseFirestoreSwift
import Foundation

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? // Firebase Auth user
    @Published var currentUser: User? // Our user

    init() {
        userSession = Auth.auth().currentUser

        Task {
            await fetchUser()
        }
    }

    func login(withEmail email: String, password: String) async throws {
        do {
            var response = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = response.user

            await fetchUser()
        } catch {
            print("Error login \(error)")
        }
    }

    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            let user = User(id: result.user.uid, fullname: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)

            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }

    func signOut() throws {
        do {
            try Auth.auth().signOut()
            userSession = nil
            currentUser = nil
        } catch {
            print("Error during SignOut: \(error.localizedDescription)")
        }
    }

    func deleteAccount() {}

    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        currentUser = try? snapshot.data(as: User.self)
    }
}
