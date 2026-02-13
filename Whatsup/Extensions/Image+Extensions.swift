//
//  Image+Extensions.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 04/02/26.
//

import Foundation
import SwiftUI

extension Image {
    func rounded(width: CGFloat = 100, height: CGFloat = 100) -> some View {
        return self.resizable()
            .frame(width: width, height: height)
            .clipShape(Circle())
    }
}
