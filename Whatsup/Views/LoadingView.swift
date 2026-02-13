//
//  LoadingView.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 11/02/26.
//

import SwiftUI

struct LoadingView: View {
    
    let message: String
    
    var body: some View {
        HStack {
            ProgressView()
                .tint(.white)
            Text(message)
        }.padding(10)
            .background(.gray)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

#Preview {
    LoadingView(message: "Sending...")
}
