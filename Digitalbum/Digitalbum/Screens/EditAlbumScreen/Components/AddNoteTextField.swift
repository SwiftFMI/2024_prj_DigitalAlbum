//
//  AddNoteTextField.swift
//  Digitalbum
//
//  Created by Vladimir Grigorov on 13.02.24.
//

import SwiftUI

struct AddNoteTextField: View {
    @Binding var userNoteTitle: String
    @Binding var userNoteBody: String
    var body: some View {
        VStack(spacing: 0) {
            TextField("Title", text: $userNoteTitle)
                .padding()
                .background(Color.secondary.cornerRadius(15))
            TextField("Note", text: $userNoteBody)
                .padding()
                .background(Color.secondary.cornerRadius(15))
        }
    }
}

//#Preview {
//    AddNoteTextField(userNoteTitle: "", userNoteBody: "")
//}
