//
//  EditPhotoScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 22.02.24.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct EditPhotoView: View {
    @State private var isShowingMenu = false
    @State private var isShowingCrop = false
    @State private var isShowingFilter = false
    @State private var isShowingRotate = false
    @Binding var image: Image

    let context = CIContext()
    @State private var currentFilter = CIFilter.sepiaTone()

    var body: some View {
        NavigationStack {
            VStack {
                image
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .background(.black)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {

                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {

                    }
                }

                ToolbarItem(placement: .bottomBar) {
                    Button("Crop") {
                        isShowingCrop.toggle()
                    }
                }

                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }

                ToolbarItem(placement: .bottomBar) {
                    Button("Rotate") {
                        isShowingRotate.toggle()
                    }
                }

                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }

                ToolbarItem(placement: .bottomBar) {
                    Button("Filter") {
//                        isShowingFilter.toggle()
                        applyFilter()
                    }
                }
            }
        }
    }

    func applyFilter() {
        let beginImage = CIImage(image: UIImage(named: "dog1")!)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)

        guard let outputImage = currentFilter.outputImage else { return }

        if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgImage)
            image = Image(uiImage: uiImage)
        }
    }
}

//#Preview {
//    Color.white
//        .sheet(isPresented: .constant(true)) {
//            EditPhotoView()
//    }
//}
