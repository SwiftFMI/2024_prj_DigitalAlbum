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
    @State var album: Album

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
            AddPageScreen(album: $album)
        }
        .sheet(isPresented: $presentAddNoteScreen) {
            AddNoteScreen()
        }
    }
}

#Preview {
    NavigationStack {
        EditAlbumScreen(album: Album(name: "Dogs"))
    }
}
