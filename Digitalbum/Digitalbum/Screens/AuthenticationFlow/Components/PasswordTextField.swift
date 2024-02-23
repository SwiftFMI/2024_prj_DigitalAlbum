//
//  PasswordTextField.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 9.02.24.
//

import SwiftUI

struct PasswordTextField: View {
    @Binding var password: String
    @State var isShowingPassword: Bool = false

    var body: some View {
        HStack {
            Group {
                if isShowingPassword {
                    TextField("Password", text: $password)
                } else {
                    SecureField("Password", text: $password)
                }
            }
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .padding()
            .background(Color(.secondarySystemBackground))
            .frame(height: 60)

            Button {
                isShowingPassword.toggle()
            }label: {
                if isShowingPassword {
                    Image(systemName: "eye")
                } else {
                    Image(systemName: "eye.slash")
                }
            }
            .padding(.trailing, 5)
        }
        .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    PasswordTextField(password: .constant("coolpassword"))
}
