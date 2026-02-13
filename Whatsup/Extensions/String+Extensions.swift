//
//  String+Extensions.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 20/01/26.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
