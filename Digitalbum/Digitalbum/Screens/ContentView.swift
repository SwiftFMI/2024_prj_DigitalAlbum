//
//  ContentView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        if AuthService.shared.userAuthenticated {
            NavigationStack {
                HomeScreen()
            }

        } else {
            SignInScreen()
        }
    }
}
