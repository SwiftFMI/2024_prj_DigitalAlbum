//
//  AuthService.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import FirebaseAuth
import FirebaseStorage

struct AuthService {
    /// Singleton instance
    static let shared = AuthService()

    private let auth = Auth.auth()

    private init() {}

    var userAuthenticated: Bool {
        auth.currentUser != nil
    }

    var currentUserEmail: String {
        auth.currentUser?.email ?? "unknown"
    }
    var currentUserUID: String {
        auth.currentUser?.uid ?? "unknown"
    }

    @MainActor
    func signIn(email: String, password: String) async {
         _ = try? await auth.signIn(withEmail: email, password: password)
    }

    @MainActor
    func signUp(email: String, password: String) async {
         _ = try? await auth.createUser(withEmail: email, password: password)
        
        if let userId = auth.currentUser?.uid {
            createFolderForUser(userId: userId)
        }
            
        func createFolderForUser(userId: String) {
            let storageRef = Storage.storage().reference()
            let userAlbumsRef = storageRef.child("users").child(userId).child("albums")
            
            userAlbumsRef.putData(Data(), metadata: nil) { metadata, error in
                if let error = error {
                    fatalError("Error creating albums folder for user \(userId): \(error.localizedDescription)")
                }
            }
        }
    }
    

    @MainActor
    func signUserOut() {
        try? auth.signOut()
    }
}
