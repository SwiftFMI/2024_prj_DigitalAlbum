//
//  AlbumView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct AlbumView: View {
    let album: Album

    var body: some View {
        Text(album.name)
    }
}

#Preview {
    AlbumView(album: .init(name: "Dogs"))
}
