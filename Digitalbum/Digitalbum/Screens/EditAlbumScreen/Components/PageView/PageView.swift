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
