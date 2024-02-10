//
//  EditAlbumViewModel.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import Foundation

class EditAlbumViewModel: ObservableObject {
    @Published var album: Album

    init(album: Album) {
        self.album = album
    }
}
