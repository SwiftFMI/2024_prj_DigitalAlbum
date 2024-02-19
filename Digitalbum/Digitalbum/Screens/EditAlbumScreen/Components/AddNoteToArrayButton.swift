//
//  AddNoteToArrayButton.swift
//  Digitalbum
//
//  Created by Vladimir Grigorov on 17.02.24.
//

import SwiftUI

struct AddNoteToArrayButton: View {
    @Binding var notes: [Note]
    @Binding var noteTitle: String
    @Binding var noteBody: String

    var body: some View {
        Button {
            notes.append(Note(title: noteTitle, text: noteBody))
            noteTitle = ""
            noteBody = ""
        }label: {
            Text("+ Add Note")
                .font(.title3)
                .foregroundStyle(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.green)
                .cornerRadius(10)
        }
    }
}

// #Preview {
//     AddNoteToArrayButton(notes: [], noteTitle: "Sample Title", noteBody: "Sample body")
// }

struct AddNoteToArrayButton_Previews: PreviewProvider {
    @State static var notes: [Note] = []
    @State static var noteTitle: String = "Sample Title"
    @State static var noteBody: String = "Sample Body"

    static var previews: some View {
        AddNoteToArrayButton(notes: $notes, noteTitle: $noteTitle, noteBody: $noteBody)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
