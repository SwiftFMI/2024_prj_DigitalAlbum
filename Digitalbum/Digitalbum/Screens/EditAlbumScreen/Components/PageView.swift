//
//  PageView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI
import PhotosUI

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
//        case .twoByTwoCool:
//            TwoByTwoCoolLayout(selectedImages: page.images)
        }
    }
}

#Preview {
    PageView(page: .constant(Page(layout: .twoByTwo, images: [
        UIImage(imageLiteralResourceName: "dog2"),
        UIImage(imageLiteralResourceName: "dog1"),
        UIImage(imageLiteralResourceName: "dog3"),
        UIImage(imageLiteralResourceName: "dog2")
    ])))
}

struct SinglePageLayout: View {
    @State var image: UIImage?
    @State var photosPickerItem: PhotosPickerItem?
        
    var body: some View {
        PhotosPicker(selection: $photosPickerItem, matching: .images) {
            Image(uiImage: image ?? UIImage(resource: .placeholder))
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .scaledToFit()
                .cornerRadius(10)
        }
        .onChange(of: photosPickerItem) { _, _ in
            Task {
                if let photosPickerItem,
                   let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                    if let imagePHP = UIImage(data: data) {
                        image = imagePHP
                    }
                }
                photosPickerItem = nil
            }
        }
    }
}

struct DoublePageLayout: View {
    @State var selectedImages: [UIImage]
    @State var photosPickerItems: [PhotosPickerItem?]

    private let columns = [
        GridItem(.flexible())
    ]

    init(images: [UIImage]) {
        self._selectedImages = State(initialValue: images)
        self._photosPickerItems = State(initialValue: Array(repeating: nil, count: images.count))
    }

        var body: some View {
            LazyVGrid(columns: columns) {
                ForEach(selectedImages.prefix(2).indices, id: \.self) { index in
                    Image(uiImage: selectedImages[index])
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFit()
                        .cornerRadius(10)
                        .onTapGesture {
                            photosPickerItems[index] = photosPickerItems[index] == nil ? PhotosPickerItem(itemIdentifier: "\(index)") : nil
                        }
                    if photosPickerItems[index] != nil, let pickerItem = photosPickerItems[index] {
                            PhotosPicker(selection: $photosPickerItems[index], matching: .images) {
                                Image(systemName: "photo")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .foregroundColor(.gray)
                            }
                            .onChange(of: pickerItem) { _, _ in
                                handleImageSelectionFromPicker(at: index)
                            }
                        }
                }
            }
        }

    private func handleImageSelectionFromPicker(at index: Int) {
        guard let pickerItem = photosPickerItems[index] else { return }
        Task {
            if let data = try? await pickerItem.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
                selectedImages[index] = image
            }
            photosPickerItems[index] = nil
        }
    }
}


struct TwoByTwoLayout: View {
    @State var selectedImages: [UIImage]
    @State var photosPickerItems: [PhotosPickerItem?]

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    init(images: [UIImage]) {
        self._selectedImages = State(initialValue: images)
        self._photosPickerItems = State(initialValue: Array(repeating: nil, count: images.count))
    }

    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(selectedImages.indices, id: \.self) { index in
                Image(uiImage: selectedImages[index])
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaledToFit()
                    .cornerRadius(10)
                    .onTapGesture {
                        photosPickerItems[index] = photosPickerItems[index] == nil ? PhotosPickerItem(itemIdentifier: "\(index)") : nil
                    }
                    if let pickerItem = photosPickerItems[index] {
                        PhotosPicker(selection: $photosPickerItems[index], matching: .images) {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .foregroundColor(.gray)
                        }
                        .onChange(of: pickerItem) { _, _ in
                            handleImageSelectionFromPicker(at: index)
                        }
                    }
            }
        }
    }

    private func handleImageSelectionFromPicker(at index: Int) {
        guard let pickerItem = photosPickerItems[index] else { return }
        Task {
            if let data = try? await pickerItem.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
                selectedImages[index] = image
            }
            photosPickerItems[index] = nil
        }
    }
}

struct TwoByTwoCoolLayout: View {
    @State  var selectedImages: [UIImage]
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    let gridWidth = UIScreen.main.bounds.width
    var body: some View {
        HStack {
            //            VStack {
            //                images[0]
            //                    .resizable()
            //                    .frame(maxWidth: gridWidth * 0.5, maxHeight: gridWidth * 0.5)
            //                    .aspectRatio(contentMode: .fit)
            //                images[1]
            //                    .resizable()
            //                    .frame(maxWidth: gridWidth * 0.5, maxHeight: gridWidth * 0.75)
            //            }
            //            VStack {
            //                images[2]
            //                    .resizable()
            //                    .frame(maxWidth: gridWidth * 0.5, maxHeight: gridWidth * 0.75)
            //                    .aspectRatio(contentMode: .fit)
            //                images[3]
            //                    .resizable()
            //                    .frame(maxWidth: gridWidth * 0.5, maxHeight: gridWidth * 0.5)
            //            }
        }
    }
}


