//
//  PasswordTextField.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String

    var body: some View {
        SecureField("Password", text: $password)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()
            .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    PasswordTextField(.constant("coolpassword"))
}
