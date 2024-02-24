//
//  SinglePageLayout.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 24.02.24.
//

import SwiftUI
import PhotosUI

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

#Preview {
    SinglePageLayout()
}
