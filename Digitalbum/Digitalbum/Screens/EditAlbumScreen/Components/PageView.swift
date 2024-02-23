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
        switch page.layout {
        case .single:
            SinglePageLayout(image: page.images.first!)
        case .double:
            DoublePageLayout(images: page.images)
        case .twoByTwo:
            TwoByTwoLayout(images: page.images)
        case .twoByTwoCool:
            TwoByTwoCoolLayout(images: page.images)
        }
    }
}

#Preview {
    PageView(page: .constant(Page(layout: .single, images: [
        Image("dog1")
//        Image("dog2"),
//        Image("dog3"),
//        Image("Placeholder")
    ])))
}

struct SinglePageLayout: View {
    let image: Image

    var body: some View {
        image
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scaledToFit()
            .cornerRadius(10)
            .onTapGesture {
                photoAction(photo: image)
            }
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
struct TwoByTwoCoolLayout: View {
    let images: [Image]
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let gridWidth = UIScreen.main.bounds.width
    var body: some View {
        HStack {
            VStack {
                images[0]
                    .resizable()
                    .frame(maxWidth: gridWidth * 0.5, maxHeight: gridWidth * 0.5)
                    .aspectRatio(contentMode: .fit)
                images[1]
                    .resizable()
                    .frame(maxWidth: gridWidth * 0.5, maxHeight: gridWidth * 0.75)
            }
            VStack {
                images[2]
                    .resizable()
                    .frame(maxWidth: gridWidth * 0.5, maxHeight: gridWidth * 0.75)
                    .aspectRatio(contentMode: .fit)
                images[3]
                    .resizable()
                    .frame(maxWidth: gridWidth * 0.5, maxHeight: gridWidth * 0.5)
            }
        }
    }
}
func photoAction (photo : Image) {
    if photo == Image("Placeholder") {
        //Photopicker
    } else {
        EditPhotoView(image: .constant(photo))
    }
}
