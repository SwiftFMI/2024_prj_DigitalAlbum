//
//  AddNoteButton.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct AddNoteButton: View {
    @Binding var presentAddNoteScreen: Bool

    var body: some View {
        Button {
            presentAddNoteScreen.toggle()
        } label: {
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

#Preview {
    AddNoteButton(presentAddNoteScreen: .constant(false))
}
