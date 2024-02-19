//
//  NotesView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct NotesView: View {
    @State var notes: [Note] = []
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(notes, id: \.self) { note in
                HStack {
                    Text(note.title)
                        .foregroundColor(.primary)
                    Text(note.text)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding()

        Spacer()
    }
}

#Preview {
    NotesView(notes: [
        Note(title: "Note1", text: "Note1"),
        Note(title: "Note2", text: "Note2"),
        Note(title: "Note3", text: "Note3")])
}
