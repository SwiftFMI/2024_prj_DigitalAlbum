//
//  ContentView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct ContentView: View {
    let authService = AuthService()

    var body: some View {
        if authService.userAuthenticated {
            NavigationStack {
                HomeScreen()
            }
        } else {
            SignInScreen()
        }
    }
}

#Preview {
    ContentView()
}
