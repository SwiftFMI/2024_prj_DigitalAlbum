//
//  UserInfoTextField.swift
//  Digitalbum
//
//  Created by Martin Pahnev on 11.02.24.
//

import SwiftUI

struct UserInfoTextField: View {
    @Binding var text: String
    var placeholder: String

    init(text: Binding<String>, placeholder: String) {
        self._text = text
        self.placeholder = placeholder
    }

    var body: some View {
        TextField(placeholder, text: $text)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()
            .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    UserInfoTextField(text: .constant("Hi, my name is "), placeholder: "Tell us more about yourself!")
}
