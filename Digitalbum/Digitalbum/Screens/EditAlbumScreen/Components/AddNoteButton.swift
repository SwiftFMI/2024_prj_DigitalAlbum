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
            ZStack {
                LinearGradient(
                    colors: [.green, .cyan],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .cornerRadius(10)
                .frame(height: 50)

                Text("+ Add Note")
                    .font(.title3)
                    .foregroundStyle(.white)
            }
            .shadow(radius: 10, x: 10, y: 10)
        }
    }
}

#Preview {
    AddNoteButton(presentAddNoteScreen: .constant(false))
}
