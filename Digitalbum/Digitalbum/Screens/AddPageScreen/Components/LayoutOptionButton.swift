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
            ZStack {
                LinearGradient(
                    colors: [.orange, .red],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .cornerRadius(10)
                .frame(height: 50)

                Text(title)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.white)
            }

        }
    }
}

#Preview {
    LayoutOptionButton(title: "Single Image", action: { print("Button tapped") })
}
