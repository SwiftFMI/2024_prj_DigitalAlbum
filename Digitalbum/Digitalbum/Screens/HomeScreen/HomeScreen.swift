//
//  HomeScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var showAlert = false
    @State private var albumName = ""
    @State private var albums: [Album] = []

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(albums) { album in
                    NavigationLink(destination: EditAlbumScreen(album: album)) {
                        AlbumView(album: album)
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Your Albums")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NewAlbumButton(showAlert: $showAlert)
            }
        }
        .alert(
            Text("Create New Album"),
            isPresented: $showAlert
        ) {
            Button("Cancel", role: .cancel) {
                albumName = ""
            }
            Button("Create") {
                albums.append(.init(name: albumName))
                albumName = ""
            }
            TextField("Album Name", text: $albumName)
        }
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
    }
}
