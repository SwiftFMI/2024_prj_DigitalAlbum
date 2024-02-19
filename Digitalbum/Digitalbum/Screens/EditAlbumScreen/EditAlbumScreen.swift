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
    var selectedPageIndex: Int = 0
    @StateObject var model: EditAlbumViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach($model.album.pages) { page in
                    PageContentView(
                        presentAddNoteScreen: $presentAddNoteScreen,
                        page: page
                    )
//                    selectedPageIndex += 1
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
            AddNoteScreen(notes: $model.album.pages[selectedPageIndex].notes)

        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let album = Album(name: "Dogs", pages: [
        .init(layout: .single, images: [Image("dog1"), Image("dog2"), Image("dog3"), Image("dog4")]),
        .init(layout: .double, images: [Image("dog1"), Image("dog2"), Image("dog3"), Image("dog4")]),
        .init(layout: .twoByTwo, images: [Image("dog1"), Image("dog2"), Image("dog3"), Image("dog4")]),
        .init(layout: .twoByTwoCool, images: [Image("dog1"), Image("dog2"), Image("dog3"), Image("dog4")])
    ])

    return NavigationStack {
        EditAlbumScreen(model: .init(album: album))
    }
}
