//
//  LayoutOptionButton.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct LayoutOptionButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title3)
                .foregroundStyle(.white)
                .frame(minWidth: 0, maxWidth: .infinity)
                .frame(height: 50)
                .background(Color.orange)
                .cornerRadius(10)
        }
    }
}

#Preview {
    LayoutOptionButton(title: "Single Image", action: { print("Button tapped") })
}
