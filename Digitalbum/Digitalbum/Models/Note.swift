//
//  Note.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import Foundation

struct Note : Identifiable, Hashable{
    let id = UUID()
    let title: String
    let text: String
}
