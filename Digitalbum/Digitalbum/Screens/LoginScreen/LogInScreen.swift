//
//  ScreenView.swift
//  Digitalbum
//
//  Created by Martin Pahnev on 8.02.24.
//

import SwiftUI
import FirebaseAuth

struct AuthService {
    private let auth = Auth.auth()
    
    var userAuthenticated: Bool {
        return auth.currentUser != nil
    }
    
    func signIn(email: String, password: String, completion: @escaping () -> Void) {
        auth.signIn(withEmail: email,
                    password: password) { result, error in
            guard result != nil, error == nil else {
                return
            }
            completion()
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping () -> Void ) {
        auth.createUser(withEmail: email,
                        password: password) {  result, error in
            guard result != nil, error == nil else {
                return
            }
            completion()
        }
    }
    
    func signout(completion: @escaping () -> Void) {
        try? auth.signOut()
        completion()
    }
}

class LoginViewModel: ObservableObject {
    
    @Published var signedIn = false
    
    
}

struct SignInScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var presentHomeScreen = false
    private let authService = AuthService()
    
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
                    authService.signIn(email: email, password: password) {
                        DispatchQueue.main.async {
                            presentHomeScreen = true
                        }
                    }
                }, label: {
                    Text("Sign In")
                        .foregroundColor(Color.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .cornerRadius(8)
                })
                NavigationLink("Create Account", destination: SignUpScreen())
                    .padding()
            }
            .padding()
            Spacer()
        }
        .sheet(isPresented: $presentHomeScreen) {
            HomeScreen()
        }
        
    }
}
struct SignUpScreen: View {
    @State private var email = ""
    @State private var password = ""
    @State private var presentHomeScreen = false
    private let authService = AuthService()
    
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
                    authService.signUp(email: email, password: password) {
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
    SignInScreen()
}
