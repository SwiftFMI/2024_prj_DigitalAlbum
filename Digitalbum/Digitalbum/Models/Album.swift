//
//  Album.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct Album: Identifiable {
    let id: String = UUID().uuidString
    var name: String
    var pages: [Page] = []
}
