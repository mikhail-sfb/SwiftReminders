//
//  PhotosPicker.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI
import PhotosUI

struct PhotosPickerTest: View {
    @State var photo: PhotosPickerItem?
    @State var selectedImage: Image?
    @State var photos: [PhotosPickerItem] = []
    @State var selectedImages: [Image] = []
    
    var body: some View {
        VStack {
            PhotosPicker(selection: $photo, matching: .images) {
                Text("Select an image")
            }
            
            PhotosPicker(selection: $photos, matching: .images) {
                Text("Select images")
            }
            
            Spacer()
            
            if let selectedImage {
                Text("Selected photo")
                
                selectedImage
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            if !photos.isEmpty {
                Text("Selected images")
                
                List {
                    ForEach(0..<selectedImages.count, id: \.self) { index in
                        selectedImages[index]
                            .resizable()
                            .scaledToFit()
                    }
                    .padding()
                }
            }
        }
        .font(.title)
        .onChange(of: photo) { _, newPhoto in
            if let newPhoto {
                Task {
                    selectedImage = await newPhoto.convert()
                }
            }
        }
        .onChange(of: photos) { _, newPhotos in
            Task {
                for newPhoto in newPhotos {
                    selectedImages.append(await newPhoto.convert())
                }
            }
        }
    }
}

extension PhotosPickerItem {
    // The loadTransferable function attempts to load the selected item(s)
    // into memory so you can then convert them and prepare them to show in a SwiftUI view.
    
    // The @MainActor helps us make sure that the image returned is done
    // so on the main thread since that is where it is called from.
    
    @MainActor
    func convert() async  -> Image {
        do {
            if let data = try await self.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data) {
                    return Image(uiImage: uiImage)
                }
            }
        } catch {
            print("Error: \(error)")
        }
        
        return Image(systemName: "xmark.circle")
    }
    
}

#Preview {
    PhotosPickerTest()
}
