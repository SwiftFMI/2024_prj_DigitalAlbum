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
        VStack(spacing: 15) {
            ForEach(notes) { note in
                NoteView(note: note)
            }
        }
    }
}

struct NoteView: View {
    let note: Note

    var body: some View {
        ZStack(alignment: .topLeading) {
            LinearGradient(
                colors: [.blue, .cyan],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(10)
            .foregroundStyle(.white)
            .frame(height: 200)
            .shadow(radius: 10, x: 10, y: 5)
            
            VStack(alignment: .leading, spacing: 10) {
                Text(note.title)
                    .font(.title)
                Text(note.text)
            }
            .foregroundStyle(.white)
            .padding()
        }
    }
}

#Preview {
    NotesView(notes: [
        Note(title: "Title 1", text: "This is my very goo friend here"),
        Note(title: "Another Note", text: "I just remembered I am a moron"),
        Note(title: "Final Note", text: "Yeah, kinda melodramatic vibes here")])
}
