//
//  ErrorWrapper.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 11/02/26.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
    var guidance: String = ""
}
