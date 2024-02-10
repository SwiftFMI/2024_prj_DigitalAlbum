//
//  AddPageScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct AddPageScreen: View {
    @Binding var album: Album

    var body: some View {
        Text("Choose Page Layout")
            .font(.title)
            .padding(.vertical, 50)
        VStack {
            LayoutOptionButton(title: "Single Image") {
                album.pages.append(Page(layout: .single))
            }
            LayoutOptionButton(title: "Two Images") {
                album.pages.append(Page(layout: .double))
            }
            LayoutOptionButton(title: "Four Images") {
                album.pages.append(Page(layout: .twoByTwo))
            }
            LayoutOptionButton(title: "Four Images Cool") {
                album.pages.append(Page(layout: .twoByTwoCool))
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    AddPageScreen(album: .constant(Album(name: "My Album")))
}
