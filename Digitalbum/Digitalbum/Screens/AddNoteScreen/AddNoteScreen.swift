//
//  AddNoteScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct AddNoteScreen: View {
    @Binding var isPresented: Bool
    @State var title: String = ""
    @State var noteBody: String = ""

    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .font(.title)
                .padding()

            TextEditor(text: $noteBody)
                .padding()
        }
        .navigationBarItems(
            leading: Button("Cancel") {
                isPresented.toggle()
            },
            trailing: Button("Save") {
                // Save note
                isPresented.toggle()
            }
        )
    }
}

#Preview {
     AddNoteScreen(isPresented: .constant(true))
}
