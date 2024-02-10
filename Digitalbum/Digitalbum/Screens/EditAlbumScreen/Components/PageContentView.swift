//
//  PageContentView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct PageContentView: View {
    @Binding var presentAddNoteScreen: Bool
    @Binding var page: Page

    var body: some View {
        ScrollView {
            VStack {
                PageView(page: $page)
                AddNoteButton(presentAddNoteScreen: $presentAddNoteScreen)
                NotesView()
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width)
    }
}

#Preview {
    PageContentView(presentAddNoteScreen: .constant(false), page: .constant(Page(layout: .single)))
}
