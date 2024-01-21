//
//  ContentView.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}
