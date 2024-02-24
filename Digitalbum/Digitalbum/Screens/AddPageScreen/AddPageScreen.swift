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
        VStack(spacing: 50) {
            Text("Choose Layout")
                .font(.largeTitle)
                .bold()
                .foregroundStyle(
                    LinearGradient(
                        colors: [.orange, .red],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )

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
            }
        }
        .padding(.vertical, 50)
        .padding(.horizontal)
        Spacer()
    }
}

#Preview {
    AddPageScreen(album: .constant(Album(name: "My Album")), dismiss: .constant(false))
}
