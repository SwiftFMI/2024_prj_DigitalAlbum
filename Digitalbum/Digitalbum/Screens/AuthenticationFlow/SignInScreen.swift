//
//  ScreenView.swift
//  Digitalbum
//
//  Created by Martin Pahnev on 8.02.24.
//

import SwiftUI

struct SignInScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var presentHomeScreen = false
    @State private var presentSignUpScreen = false
    @State private var showWrongCredentialsAlert = false

    var body: some View {
        VStack(spacing: 15) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)

            VStack {
                EmailTextField(email: $email)
                PasswordTextField(password: $password)
                AuthButton(title: "Sign In") {
                    Task {
                        guard !email.isEmpty, !password.isEmpty else {
                            showWrongCredentialsAlert.toggle()
                            return
                        }

                        await AuthService.shared.signIn(email: email, password: password)

                        if AuthService.shared.userAuthenticated {
                            presentHomeScreen.toggle()
                        } else {
                            showWrongCredentialsAlert.toggle()
                        }
                    }
                }
                .padding()

                Button {
                    presentSignUpScreen.toggle()

                } label: {
                    Text("Create account")
                }
            }
            .padding()

            Spacer()
        }
        .fullScreenCover(isPresented: $presentHomeScreen) {
            NavigationStack {
                HomeScreen()
            }
        }
        .sheet(isPresented: $presentSignUpScreen) {
            SignUpScreen()
        }
        .alert(isPresented: $showWrongCredentialsAlert) {
            Alert(
                title: Text("Wrong Email or Passowrd"),
                message: nil,
                dismissButton: .default(Text("Try Again")))
        }
    }
}

#Preview {
    SignInScreen()
}
