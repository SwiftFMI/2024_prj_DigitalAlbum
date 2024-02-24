//
//  DoublePageLayout.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 24.02.24.
//

import SwiftUI
import PhotosUI

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
