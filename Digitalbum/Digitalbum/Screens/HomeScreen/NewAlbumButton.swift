//
//  NewAlbumButton.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct NewAlbumButton: View {
    @Binding var showAlert: Bool

    var body: some View {
        Button {
            showAlert.toggle()
        } label: {
            Image(systemName: "plus")
        }
    }
}

#Preview {
    NewAlbumButton(showAlert: .constant(false))
}
