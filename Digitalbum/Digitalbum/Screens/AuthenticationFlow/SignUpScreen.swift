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
        VStack(spacing: 100) {
            Image("AppLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)

            VStack {
                TextField("Email Address", text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))

                SecureField("Password", text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(.secondarySystemBackground))

                Button(action: {
                    guard !email.isEmpty, !password.isEmpty else {
                        return
                    }
                    AuthService.shared.signUp(email: email, password: password) {
                        DispatchQueue.main.async {
                            presentHomeScreen = true
                        }
                    }
                }, label: {
                    Text("Create Account")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                })
            }
            .padding()
            Spacer()
        }
        .sheet(isPresented: $presentHomeScreen) {
            HomeScreen()
        }

    }
}

#Preview {
    SignUpScreen()
}
