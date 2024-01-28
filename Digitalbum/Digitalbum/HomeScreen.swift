//
//  HomeScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI

struct HomeScreen: View {
    @State private var showAlert = false
    @State private var albumName = ""

    var body: some View {
        Text("Somte")
            .navigationTitle("Your Albums")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAlert.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .alert(
                Text("Create New Album"),
                isPresented: $showAlert
            ) {
                Button("Cancel", role: .cancel) {
                    print("Tapped cancel")
                }
                Button("Create") {
                    print("Create")
                }
                TextField("Album Name", text: $albumName)
            }
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
    }
}
