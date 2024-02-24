//
//  ProfileScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct ProfileScreen: View {
    let user: UserProfileInfo = .init(
        email: "mylittlepony@cool.com",
        firstName: "Lightning",
        lastName: "McQueen",
        birthDate: Date(),
        coolInfo: "I am a car that can talk, sleep and repair roads."
    )

    @State private var presentSignInScreen = false

    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                ProfileImage()
                Text("Profile Information")
                    .font(.title)

                VStack(alignment: .leading) {
                    UserInfoView(type: "Name", content: user.firstName + " " + user.lastName)
                    UserInfoView(type: "Email", content: user.email)
                    UserInfoView(
                        type: "Date of Birth",
                        content: user.birthDate.formatted(date: .abbreviated, time: .omitted))
                    UserInfoView(type: "Bio", content: user.coolInfo)
                }
            }

            Spacer()
            SignOutButton(presentSignInScreen: $presentSignInScreen)

        }
        .padding()
        .fullScreenCover(isPresented: $presentSignInScreen) {
            SignInScreen()
        }
    }
}

#Preview {
    ProfileScreen()
}
