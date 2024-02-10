//
//  SignOutButton.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import SwiftUI

struct SignOutButton: View {
    @Binding var presentSignInScreen: Bool

    var body: some View {
        Button {
            AuthService.shared.signUserOut()
            presentSignInScreen.toggle()

        } label: {
            Text("Sign Out")
                .foregroundStyle(.red)
        }

    }
}

#Preview {
    SignOutButton(presentSignInScreen: .constant(true))
}
