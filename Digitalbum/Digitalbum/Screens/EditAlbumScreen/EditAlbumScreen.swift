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
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(album.pages) { page in
                    PageContentView(presentAddNoteScreen: $presentAddNoteScreen)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
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

struct PageContentView: View {
    @Binding var presentAddNoteScreen: Bool

    var body: some View {
        ScrollView {
            VStack {
                PageView()
                AddNoteButton(presentAddNoteScreen: $presentAddNoteScreen)
                NotesView()
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

#Preview {
    NavigationStack {
        EditAlbumScreen(album: Album(name: "Dogs", pages: [
            .init(layout: .single),
            .init(layout: .single),
            .init(layout: .single),
        ]))
    }
}
