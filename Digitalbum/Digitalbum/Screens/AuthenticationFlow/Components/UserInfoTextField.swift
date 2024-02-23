//
//  EmailTextField.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import SwiftUI

struct UserInfoTextField: View {
    @Binding var userInfo: String

    var body: some View {
        TextField("Tell us something about yourself!", text: $userInfo)
            .disableAutocorrection(true)
            .padding()
            .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    EmailTextField(email: .constant("Hi I'm Martin..."))
}
