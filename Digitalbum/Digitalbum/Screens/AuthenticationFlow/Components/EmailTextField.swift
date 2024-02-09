//
//  EmailTextField.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var email: String

    var body: some View {
        TextField("Email Address", text: $email)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()
            .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    EmailTextField(email: .constant("myemail@hotmail.com"))
}
