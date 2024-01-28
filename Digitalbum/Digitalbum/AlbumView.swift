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
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 4)
                    .fill(.blue)
                Image(systemName: "photo")
                    .foregroundStyle(.white)
            }
            Text(album.name)
        }
        .frame(minHeight: 200)
    }
}

#Preview {
    AlbumView(album: .init(name: "Dogs"))
}
