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
    
    var body: some View {
        VStack(spacing: 15) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
            
            Form {
                TextField(text: $email) {
                    Text("Email")
                }
                TextField(text: $password) {
                    Text("Password")
                }
                TextField(text: $userName) {
                    Text("First and Last Name")
                }
                DisclosureGroup("Birth Date") {
                    DatePicker(selection: $userDateOfBirth, displayedComponents: .date) {
                        Text("Date of Birth")
                    }
                    .datePickerStyle(.wheel)
                }
                TextField(text: $infoAboutUser) {
                    Text("Tell us something cool about youself!")
                }
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
    }
}
#Preview {
    SignUpScreen()
}
