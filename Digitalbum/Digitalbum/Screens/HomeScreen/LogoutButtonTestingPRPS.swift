//
//  LogoutButtonTestingPRPS.swift
//  Digitalbum
//
//  Created by Martin Pahnev on 9.02.24.
//

import SwiftUI

struct LogoutButton: View {
    @EnvironmentObject var viewModel: LoginViewModel

    var body: some View {
        Button {
            viewModel.signedIn = false
            SignInView()
        } label: {
            Text("🙋‍♂️")
        }
    }
}
