//
//  UploadAlbumButton.swift
//  Digitalbum
//
//  Created by Martin Pahnev on 23.02.24.
//

import SwiftUI

struct UploadAlbumButton: View {
    @Binding var showUploadAlert: Bool

    var body: some View {
        Button {
            showUploadAlert.toggle()
        } label: {
            Image(systemName: "square.and.arrow.up")
                .foregroundStyle(
                    LinearGradient(
                        colors: [.blue, .cyan],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
        }
    }
}

#Preview {
    UploadAlbumButton(showUploadAlert: .constant(false))
}
