//
//  AppState.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 21/01/26.
//

import Foundation
import Combine

enum LoadingState: Hashable, Identifiable {
    case idle
    case loading(String)
    
    var id: Self {
        return self
    }
}

enum Route: Hashable {
    case main
    case login
    case signUp
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
    @Published var loadingState: LoadingState = .idle
    @Published var errorWrapper: ErrorWrapper?
}
