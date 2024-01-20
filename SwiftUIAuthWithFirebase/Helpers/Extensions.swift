//
//  Helpers.swift
//  SwiftUIAuthWithFirebase
//
//  Created by Omer Cagri Sayir on 20.01.2024.
//

import Foundation

extension String {
    func firstLetters() -> String {
        return split(separator: " ").map { String($0.first!) }.joined()
    }
}
