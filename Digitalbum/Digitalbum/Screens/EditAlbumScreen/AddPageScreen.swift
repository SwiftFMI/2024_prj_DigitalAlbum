//
//  AddPageScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct AddPageScreen: View {
    @Binding var album: Album
    @Binding var dismiss: Bool

    var body: some View {
        Text("Choose Page Layout")
            .font(.title)
            .padding(.vertical, 50)
        VStack {
            LayoutOptionButton(title: "Single Image") {
                album.pages.append(Page(layout: .single))
                dismiss.toggle()
            }
            LayoutOptionButton(title: "Two Images") {
                album.pages.append(Page(layout: .double))
                dismiss.toggle()
            }
            LayoutOptionButton(title: "Four Images") {
                album.pages.append(Page(layout: .twoByTwo))
                dismiss.toggle()
            }
            LayoutOptionButton(title: "Four Images Cool") {
                album.pages.append(Page(layout: .twoByTwoCool))
                dismiss.toggle()
            }
        }
        .padding()
        Spacer()
    }
}

#Preview {
    AddPageScreen(album: .constant(Album(name: "My Album")), dismiss: .constant(false))
}
