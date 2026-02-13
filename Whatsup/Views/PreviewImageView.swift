//
//  PreviewImageView.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 11/02/26.
//

import SwiftUI

struct PreviewImageView: View {
    
    let selectedImage: UIImage
    var onCancel: () -> Void
    
    var body: some View {
        ZStack {
            Image(uiImage: selectedImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .overlay(alignment: .topTrailing) {
            Button {
                onCancel()
            } label: {
                Image(systemName: "multiply.circle.fill")
                    .padding(.top, 50)
                    .padding(.trailing, 10)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
    }
}
