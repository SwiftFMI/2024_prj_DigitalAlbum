//
//  SignUpScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import SwiftUI

struct SignUpScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var presentHomeScreen = false

    var body: some View {
        VStack(spacing: 15) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)

            VStack {
                EmailTextField(email: $email)
                PasswordTextField(password: $password)
                AuthButton(title: "Create Account") {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }

                    AuthService.shared.signUp(email: email, password: password)

                    if AuthService.shared.userAuthenticated {
                        presentHomeScreen.toggle()
                    }
                }
                .padding()
            }
            .padding()

            Spacer()
        }
        .fullScreenCover(isPresented: $presentHomeScreen) {
            NavigationStack {
                HomeScreen()
            }
        }
    }
}

#Preview {
    SignUpScreen()
}
