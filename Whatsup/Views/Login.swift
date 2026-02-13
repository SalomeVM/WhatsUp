//
//  Login.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 20/01/26.
//

import SwiftUI
import FirebaseAuth

struct Login: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject private var appState: AppState
    
    private var isFormValid: Bool {
        !email.isEmptyOrWhiteSpace && !password.isEmptyOrWhiteSpace
    }
    
    private func login() async {
        do {
            let _ = try await Auth.auth().signIn(withEmail: email, password: password)
            appState.routes.append(.main)
        } catch {
            appState.errorWrapper = ErrorWrapper(error: error)
        }
    }
    
    var body: some View {
        Form {
            TextField("Email", text: $email)
                .textInputAutocapitalization(.never)
            SecureField("Password", text: $password)
                .textInputAutocapitalization(.never)
            HStack {
                Spacer()
                Button("Login") {
                    Task {
                        await login()
                    }
                }.disabled(!isFormValid)
                    .buttonStyle(.borderless)
                Button("Sign Up") {
                    appState.routes.append(.signUp)
                }.buttonStyle(.borderless)
                Spacer()
            }
        }
    }
}

struct Login_PreviewStorage: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(AppState())
    }
}
