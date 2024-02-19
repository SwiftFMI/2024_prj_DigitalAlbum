//
//  AddNoteScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct AddNoteScreen: View {
    @Binding var notes: [Note]
    @State var userNoteTitle: String = ""
    @State var userNoteBody: String = ""
    var body: some View {
        VStack {
            AddNoteTextField(userNoteTitle: $userNoteTitle, userNoteBody: $userNoteBody)
            AddNoteToArrayButton(notes: $notes, noteTitle: $userNoteTitle, noteBody: $userNoteBody)
        }
    }
}

// #Preview {
//     AddNoteScreen()
//}
