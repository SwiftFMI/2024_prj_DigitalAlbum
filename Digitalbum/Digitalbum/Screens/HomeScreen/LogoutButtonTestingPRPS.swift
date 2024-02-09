//
//  LogoutButtonTestingPRPS.swift
//  Digitalbum
//
//  Created by Martin Pahnev on 9.02.24.
//

import SwiftUI

struct LogoutButton: View {
    private let authService = AuthService()
    var body: some View {
        Button {
            authService.signout {
                
            }
        } label: {
            Text("🙋‍♂️")
        }
    }
}
