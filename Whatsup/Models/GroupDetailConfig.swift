//
//  GroupDetailConfig.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 11/02/26.
//

import Foundation
import SwiftUI

struct GroupDetailConfig {
    var chatText: String = ""
    var sourceType: UIImagePickerController.SourceType?
    var selectedImage: UIImage?
    var showOptions: Bool = false
    
    mutating func clearForm() {
        chatText = ""
        selectedImage = nil
    }
    
    var isValid: Bool {
        !chatText.isEmptyOrWhiteSpace || selectedImage != nil
    }
}
