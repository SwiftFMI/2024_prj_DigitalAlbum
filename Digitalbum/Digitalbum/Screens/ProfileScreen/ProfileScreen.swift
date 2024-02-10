//
//  ProfileScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct ProfileScreen: View {
    @State private var presentSignInScreen = false

    var body: some View {
        VStack(spacing: 150) {
            Text("Profile Information")
                .font(.title)
            Text("Email: \(AuthService.shared.currentUserEmail)")
                .font(.headline)
            SignOutButton(presentSignInScreen: $presentSignInScreen)
        }
        .padding(.vertical, 100)
        .fullScreenCover(isPresented: $presentSignInScreen) {
            SignInScreen()
        }
        Spacer()
    }
}

#Preview {
    ProfileScreen()
}
