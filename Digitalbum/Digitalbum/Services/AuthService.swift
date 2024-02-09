//
//  AuthService.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import FirebaseAuth

struct AuthService {
    /// Singleton instance
    static let shared = AuthService()

    private let auth = Auth.auth()

    private init() {}

    var userAuthenticated: Bool {
        return auth.currentUser != nil
    }

    @MainActor
    func signIn(email: String, password: String) {
        Task {
            try? await auth.signIn(withEmail: email, password: password)
        }
    }

    @MainActor
    func signUp(email: String, password: String) {
        Task {
            try? await auth.createUser(withEmail: email, password: password)
        }
    }

    @MainActor
    func signUserOut() {
        try? auth.signOut()
    }
}
