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
    @State private var userName = ""
    @State private var infoAboutUser = ""
    @State private var userDateOfBirth = Date()
    @State private var showEmptyCredentialsAlert = false
    @State private var showEmailInUseAlert = false

    var body: some View {
        VStack(spacing: 15) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)

            Form {
                EmailTextField(email: $email)
                PasswordTextField(password: $password)
                UserNamesTextField(userNames: $userName)
                DisclosureGroup("Birth Date") {
                    DatePicker(selection: $userDateOfBirth, displayedComponents: .date) {
                        Text("Date of Birth")
                    }
                    .datePickerStyle(.wheel)
                }
                .tint(.black)
                UserInfoTextField(userInfo: $infoAboutUser)
            }
            AuthButton(title: "Create Account") {
                Task {
                    guard !email.isEmpty, !password.isEmpty else {
                        showEmptyCredentialsAlert.toggle()
                        return
                    }

                    await AuthService.shared.signUp(email: email, password: password)

                    if AuthService.shared.userAuthenticated {
                        presentHomeScreen.toggle()
                    } else {
                        showEmailInUseAlert.toggle()
                        return
                    }
                }
            }

            Spacer()
        }
        .background(Color(.secondarySystemBackground))
        .fullScreenCover(isPresented: $presentHomeScreen) {
            NavigationStack {
                HomeScreen()
            }
        }
        .alert(isPresented: $showEmptyCredentialsAlert) {
            Alert(
                title: Text("Empty Email or Passowrd"),
                message: nil,
                dismissButton: .default(Text("Try Again")))
        }
        .alert(isPresented: $showEmailInUseAlert) {
            Alert(
                title: Text("Email already in use, try again!"),
                message: nil,
                dismissButton: .default(Text("Try Again")))
        }
    }
}

#Preview {
    SignUpScreen()
}
