//
//  ReusableMediaPicker.swift
//  RCSUI
//
//  Created by Chandra Sekhar Ravi on 2025-08-21.
//


import SwiftUI
import PhotosUI
import UIKit

enum MediaSource {
    case camera
    case photoLibrary
}

struct ReusableMediaPicker: ViewModifier {
    let source: MediaSource
    @Binding var isPresented: Bool
    @Binding var selectedImage: UIImage?

    @State private var selectedItem: PhotosPickerItem?

    func body(content: Content) -> some View {
        content
            // Camera
            .fullScreenCover(isPresented: Binding(
                get: { isPresented && source == .camera },
                set: { isPresented = $0 }
            )) {
                CameraPicker(selectedImage: $selectedImage)
            }

            // Photo Library
            .photosPicker(
                isPresented: Binding(
                    get: { isPresented && source == .photoLibrary },
                    set: { isPresented = $0 }
                ),
                selection: $selectedItem,
                matching: .images
            )
            .onChange(of: selectedItem) { newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        selectedImage = uiImage
                    }
                }
            }
    }
}

extension View {
    func mediaPicker(
        source: MediaSource,
        isPresented: Binding<Bool>,
        selectedImage: Binding<UIImage?>
    ) -> some View {
        self.modifier(ReusableMediaPicker(source: source, isPresented: isPresented, selectedImage: selectedImage))
    }
}
