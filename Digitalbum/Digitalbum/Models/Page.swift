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
    case twoByTwoCool
}

struct Page {
    let layout: PageLayout
    var images: [Image] = []
}

