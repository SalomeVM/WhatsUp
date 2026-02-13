//
//  SignUpView.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 20/01/26.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var displayName: String = ""
//    @State private var errorMessage: String = ""
    
    @EnvironmentObject private var model: Model
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace && !displayName.isEmptyOrWhiteSpace
    }
    
    private func signUp() async {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            try await model.updateDisplayName(for: result.user, displayName: displayName)
            appState.routes.append(.login)
        } catch {
            appState.errorWrapper = ErrorWrapper(error: error)
//            errorMessage = error.localizedDescription
        }
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            TextField("Display name", text: $displayName)
            
            HStack {
                Spacer()
                Button("Login") {
                    appState.routes.append(.login)
                }.buttonStyle(.borderless)
                Button("Sign up") {
                    Task {
                        await signUp()
                    }
                }.disabled(!isFormValid)
                    .buttonStyle(.borderless)
                
                Spacer()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(Model())
            .environmentObject(AppState())
    }
}


//#Preview {
//    SignUpView()
//}
