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
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.secondarySystemBackground))
                    .strokeBorder(style: .init(lineWidth: 2, dash: [10]))
                    .tint(.gray)
                    .shadow(radius: 10, x: 5, y: 10)
                Text("Sign Out")
                    .foregroundStyle(.red)
                    .padding()
            }
            .frame(maxHeight: 50)
        }

    }
}

#Preview {
    SignOutButton(presentSignInScreen: .constant(true))
}
