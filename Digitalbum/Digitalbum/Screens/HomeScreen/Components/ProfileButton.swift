//
//  ProfileButton.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct ProfileButton: View {
    @Binding var presentProfileScreen: Bool

    var body: some View {
        Button {
            presentProfileScreen.toggle()
        } label: {
            Image(systemName: "person.circle")
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .cyan],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
    }
}

#Preview {
    ProfileButton(presentProfileScreen: .constant(false))
}
