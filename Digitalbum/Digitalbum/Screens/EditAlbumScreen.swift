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
        .ignoresSafeArea(edges: .bottom)
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
            AddNoteScreen(isPresented: $presentAddNoteScreen)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    let album = Album(name: "Dogs", pages: [
//        .init(layout: .single, images: [Image("dog1"), Image("dog2"), Image("dog3"), Image("dog4")], notes: [.init(title: "Good", text: "I really like this pciture, it remindes me of that time I was cool"), .init(title: "Second Thought", text: "On second thought, I been good looking ever since too. Hot damn!")]),
//        .init(layout: .double, images: [Image("dog1"), Image("dog2"), Image("dog3"), Image("dog4")]),
//        .init(layout: .twoByTwo, images: [Image("dog1"), Image("dog2"), Image("dog3"), Image("dog4")]),
//        .init(layout: .twoByTwoCool, images: [Image("dog1"), Image("dog2"), Image("dog3"), Image("dog4")])
//    ])
//
//    return NavigationStack {
//        EditAlbumScreen(model: .init(album: album))
//    }
//}
