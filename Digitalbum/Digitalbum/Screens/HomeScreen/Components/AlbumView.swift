//
//  AlbumView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct AlbumView: View {
    let album: Album
    @State private var isAnimating = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.blue, .cyan],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .cornerRadius(10)
            VStack {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white)

                Text(album.name)
                    .foregroundStyle(.white)
                    .font(.title)
                    .bold()

                Spacer()
            }
            .padding()
        }
        .shadow(radius: 10, x: 10, y: 10)
        .frame(minHeight: 200)
    }
}

#Preview {
    AlbumView(album: .init(name: "My cool album"))
}
