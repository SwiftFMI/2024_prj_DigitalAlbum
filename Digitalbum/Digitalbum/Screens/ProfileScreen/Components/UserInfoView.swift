//
//  UserInfoView.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 19.02.24.
//

import SwiftUI

struct UserInfoView: View {
    let type: String
    let content: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.secondarySystemBackground))
            HStack {
                VStack(alignment: .leading) {
                    Text(type)
                        .font(.footnote)
                        .backgroundStyle(Color(.secondaryLabel))
                    Text(content)
                }
                Spacer()
            }
            .padding()
        }

    }
}

#Preview {
    UserInfoView(type: "Email", content: "gosho@kruchma.com")
}
