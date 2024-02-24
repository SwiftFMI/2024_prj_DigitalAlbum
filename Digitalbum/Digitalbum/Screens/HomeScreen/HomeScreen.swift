//
//  HomeScreen.swift
//  Digitalbum
//
//  Created by Ivaylo Kalaydzhiev on 28.01.24.
//

import SwiftUI
import FirebaseAuth
import FirebaseStorage

struct HomeScreen: View {
    @State private var albumName = ""
    @State private var albums: [Album] = []
    @State private var showAlert = false
    @State private var showUploadAlert = false
    @State private var presentProfileScreen = false

    private let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(albums) { album in
                    NavigationLink(destination: EditAlbumScreen(model: .init(album: album))) {
                        AlbumView(album: album)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Your Albums")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NewAlbumButton(showAlert: $showAlert)
            }
            ToolbarItem(placement: .topBarTrailing) {
                UploadAlbumButton(showUploadAlert: $showUploadAlert)
            }
            ToolbarItem(placement: .topBarTrailing) {
                ProfileButton(presentProfileScreen: $presentProfileScreen)
            }
        }
        .alert(
            Text("Create New Album"),
            isPresented: $showAlert
        ) {
            Button("Cancel", role: .cancel) {
                albumName = ""
            }
            Button("Create") {
                albums.append(.init(name: albumName))
                albumName = ""
            }
            TextField("Album Name", text: $albumName)
                .disableAutocorrection(true)
        }
        .alert(Text("Upload ALL Albums?"),
            isPresented: $showUploadAlert
        ) {
            Button("Cancel", role: .cancel) {
                albumName = ""
            }
            Button("Upload all") {
                uploadAllAlbums()
            }
        }
        .sheet(isPresented: $presentProfileScreen) {
            ProfileScreen()
        }
    }

    func uploadAllAlbums() {
        let userId = AuthService.shared.currentUserUID
        if userId.isEmpty {
            print("User not authenticated")
            return
        }

        let storage = Storage.storage()
        let storageRef = storage.reference()

        for album in albums {
            let albumId = album.id 
            let albumFolderRef = storageRef.child("\(userId)/\(albumId)")

            for page in album.pages {
                let pageId = page.id
                let pageFolderRef = albumFolderRef.child(pageId)

                for image in page.images {
                    guard let imageData = image.jpegData(compressionQuality: 0.8) else {
                        print("Failed to convert image to data")
                        continue
                    }

                    let photoRef = pageFolderRef.child("\(UUID().uuidString).jpg")
                    uploadPhoto(image, to: photoRef)
                }
            }
        }
    }

    func uploadPhoto(_ image: UIImage, to reference: StorageReference) {
        let userId = AuthService.shared.currentUserUID
        guard !userId.isEmpty else {
            print("User not authenticated")
            return
        }

        let storage = Storage.storage()
        let storageRef = storage.reference()

        let photoData = image.jpegData(compressionQuality: 0.8)
        guard let imageData = photoData else {
            print("Failed to convert image to data")
            return
        }

        reference.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("Error uploading photo: \(error.localizedDescription)")
            } else {
                print("Photo uploaded successfully")
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeScreen()
    }
}
