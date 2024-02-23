//
//  EmailTextField.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import SwiftUI

struct UserNamesTextField: View {
    @Binding var userNames: String

    var body: some View {
        TextField("Tell us your name and surname!", text: $userNames)
            .disableAutocorrection(true)
            .padding()
            .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    EmailTextField(email: .constant("John Johnson"))
}
