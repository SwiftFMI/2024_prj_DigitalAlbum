//
//  AddPageButton.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct AddPageButton: View {
    @Binding var presentAddPageScreen: Bool

    var body: some View {
        Button {
            presentAddPageScreen.toggle()
        } label: {
            Image(systemName: "plus")
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
    AddPageButton(presentAddPageScreen: .constant(false))
}
