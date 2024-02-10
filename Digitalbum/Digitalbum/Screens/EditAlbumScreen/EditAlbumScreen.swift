//
//  EditAlbumScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct EditAlbumScreen: View {
    @State private var presentAddPageScreen = false
    @State private var presentAddNoteScreen = false
    let album: Album

    var body: some View {
        ScrollView {
            VStack {
                PageView()
                PageSlider()
                AddNoteButton(presentAddNoteScreen: $presentAddNoteScreen)
                NotesView()
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                AddPageButton(presentAddPageScreen: $presentAddPageScreen)
            }
        }
        .sheet(isPresented: $presentAddPageScreen) {
            AddPageScreen()
        }
        .sheet(isPresented: $presentAddNoteScreen) {
            AddNoteScreen()
        }
    }
}

#Preview {
    NavigationStack {
        EditAlbumScreen(album: .init(name: "Dogs"))
    }
}
