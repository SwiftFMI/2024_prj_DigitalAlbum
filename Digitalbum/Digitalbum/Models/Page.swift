//
//  Page.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

enum PageLayout {
    case single
    case double
    case twoByTwo
    //case twoByTwoCool

    var imageCount: Int {
        switch self {
        case .single: 1
        case .double: 2
        case .twoByTwo: 4
        //case .twoByTwo, .twoByTwoCool: 4
        }
    }
}

struct Page: Identifiable {
    let id = UUID().uuidString
    let layout: PageLayout
    var images: [UIImage] = [UIImage(imageLiteralResourceName: "Placeholder"),
                             UIImage(imageLiteralResourceName: "Placeholder"),
                             UIImage(imageLiteralResourceName: "Placeholder"),
                             UIImage(imageLiteralResourceName: "Placeholder")]
    var notes: [Note] = []
}
