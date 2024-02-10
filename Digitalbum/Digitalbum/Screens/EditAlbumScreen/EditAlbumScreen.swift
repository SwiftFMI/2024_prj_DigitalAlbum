//
//  EditAlbumScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

class EditAlbumViewModel: ObservableObject {
    @Published var album: Album

    init(album: Album) {
        self.album = album
    }
}

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
            AddPageScreen(album: $model.album)
        }
        .sheet(isPresented: $presentAddNoteScreen) {
            AddNoteScreen()
        }
    }
}

struct PageContentView: View {
    @Binding var presentAddNoteScreen: Bool
    @Binding var page: Page

    var body: some View {
        ScrollView {
            VStack {
                PageView() // $page
                AddNoteButton(presentAddNoteScreen: $presentAddNoteScreen)
                NotesView()
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

//#Preview {
//    NavigationStack {
//        EditAlbumScreen(album: Album(name: "Dogs", pages: [
//            .init(layout: .single),
//            .init(layout: .single),
//            .init(layout: .single),
//        ]))
//    }
//}
