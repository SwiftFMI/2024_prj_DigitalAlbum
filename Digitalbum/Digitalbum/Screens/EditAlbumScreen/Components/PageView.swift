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
        content
    }

    @ViewBuilder
    private var content: some View {
        switch page.layout {
        case .single:
            SinglePageLayout(image: page.images.first!)
        case .double:
            DoublePageLayout(images: page.images)
        case .twoByTwo:
            TwoByTwoLayout(images: page.images)
        case .twoByTwoCool:
            // TODO: Create the cool layout
            TwoByTwoLayout(images: page.images)
        }
    }
}

#Preview {
    PageView(page: .constant(Page(layout: .twoByTwo, images: [
        Image("dog1"),
        Image("dog2"),
        Image("dog3"),
        Image("dog4")
    ])))
}

struct SinglePageLayout: View {
    let image: Image

    var body: some View {
        image
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct DoublePageLayout: View {
    let images: [Image]

    var body: some View {
            VStack {
                images[0]
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

                images[1]
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
    }
}

struct TwoByTwoLayout: View {
    let images: [Image]
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns) {
            images[0]
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            images[1]
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            images[2]
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            images[3]
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
