//
//  AuthService.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import FirebaseAuth

struct AuthService {
    // Singleton instance
    static let shared = AuthService()

    private let auth = Auth.auth()

    private init() {}

    var userAuthenticated: Bool {
        return auth.currentUser != nil
    }

    func signIn(email: String, password: String, completion: @escaping () -> Void) {
        auth.signIn(withEmail: email,
                    password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            completion()
        }
    }

    func signUp(email: String, password: String, completion: @escaping () -> Void ) {
        auth.createUser(withEmail: email,
                        password: password) {  result, error in
            guard result != nil, error == nil else {
                return
            }
            completion()
        }
    }

    func signout(completion: @escaping () -> Void) {
        try? auth.signOut()
        completion()
    }
}
