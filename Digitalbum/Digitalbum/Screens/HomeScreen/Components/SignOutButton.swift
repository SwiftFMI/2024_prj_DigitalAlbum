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
        Button(action: {
            AuthService.shared.signUserOut()
            presentSignInScreen.toggle()

        }, label: {
            Text("Sing Out")
        })
    }
}

#Preview {
    SignOutButton(presentSignInScreen: .constant(true))
}
