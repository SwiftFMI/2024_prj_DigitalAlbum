//
//  ProfileImage.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 19.02.24.
//

import SwiftUI

struct ProfileImage: View {
    var body: some View {
        Image(systemName: "person.circle")
            .resizable()
            .scaledToFit()
            .padding()
            .fontWeight(.light)
            .shadow(radius: 10, x: 10, y: 10)
            .foregroundStyle(
                LinearGradient(
                    colors: [.green, .cyan],
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .frame(height: 150)
    }
}

#Preview {
    ProfileImage()
}
