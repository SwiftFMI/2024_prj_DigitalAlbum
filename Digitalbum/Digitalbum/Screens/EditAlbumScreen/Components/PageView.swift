//
//  PageView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 10.02.24.
//

import SwiftUI

struct PageView: View {
    var body: some View {
        Text("Page View")
            .font(.title3)
            .foregroundStyle(.white)
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 500)
            .background(Color.gray)
            .cornerRadius(10)
    }
}

#Preview {
    PageView()
}
