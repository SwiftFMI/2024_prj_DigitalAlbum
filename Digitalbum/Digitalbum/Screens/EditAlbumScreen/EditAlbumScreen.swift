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
    @StateObject var model: EditAlbumViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach($model.album.pages) { page in
                    PageContentView(
                        presentAddNoteScreen: $presentAddNoteScreen,
                        page: page
                    )
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
            AddPageScreen(album: $model.album, dismiss: $presentAddPageScreen)
        }
        .sheet(isPresented: $presentAddNoteScreen) {
            AddNoteScreen()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let album = Album(name: "Dogs", pages: [
        .init(layout: .single),
        .init(layout: .single),
        .init(layout: .single)
    ])

    return NavigationStack {
        EditAlbumScreen(model: .init(album: album))
    }
}
