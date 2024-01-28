//
//  EditAlbumScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct EditAlbumScreen: View {
    let album: Album

    var body: some View {
        Text(album.name)
    }
}

#Preview {
    EditAlbumScreen(album: .init(name: "Dogs"))
}
