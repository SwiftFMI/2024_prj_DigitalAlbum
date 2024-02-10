//
//  PageView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct PageView: View {
    @Binding var page: Page

    var body: some View {
        ZStack {
            Color.secondary
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 500)
                .cornerRadius(10)

            switch page.layout {
            case .single:
                SinglePageLayout(image: page.images.first!)
                    .padding()
            case .double:
                DoublePageLayout(images: page.images)
                    .padding()
            case .twoByTwo:
                TwoByTwoLayout(images: page.images)
                    .padding()
            case .twoByTwoCool:
                // TODO: Create the cool layout
                TwoByTwoLayout(images: page.images)
                    .padding()
            }

        }
    }
}

#Preview {
    PageView(page: .constant(Page(layout: .twoByTwo, images: [
        Image(systemName: "house"),
        Image(systemName: "person"),
        Image(systemName: "plus"),
        Image(systemName: "photo")
    ])))
}

struct SinglePageLayout: View {
    let image: Image

    var body: some View {
        image
            .border(.blue)
            .frame(minWidth: 0, maxWidth: .infinity)
    }
}

struct DoublePageLayout: View {
    let images: [Image]

    var body: some View {
        VStack {
            images[0]
                .border(.blue)
            images[1]
                .border(.blue)
        }
    }
}

struct TwoByTwoLayout: View {
    let images: [Image]
    private let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]

    var body: some View {
        LazyVGrid(columns: columns) {
            images[0]
                .border(.blue)
            images[1]
                .border(.blue)
            images[2]
                .border(.blue)
            images[3]
                .border(.blue)
        }
        .frame(height: 500)
    }
}
