//
//  ChatMessageInputView.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 11/02/26.
//

import SwiftUI

struct ChatMessageInputView: View {
    
    @Binding var groupDetailConfig: GroupDetailConfig
    @FocusState var isChatTextFieldFocused: Bool
    var onSendMessage: () -> Void
    
    var body: some View {
        HStack {
            Button {
                groupDetailConfig.showOptions = true
            } label: {
                Image(systemName: "plus")
            }
            
            TextField("Enter text here", text: $groupDetailConfig.chatText)
                .textFieldStyle(.roundedBorder)
                .focused($isChatTextFieldFocused)
            
            Button {
                if groupDetailConfig.isValid {
                    onSendMessage()
                }
            } label: {
                Image(systemName: "paperplane.circle.fill")
            }
        }
    }
}

#Preview {
    ChatMessageInputView(groupDetailConfig: .constant(GroupDetailConfig(chatText: "Hello World!")), onSendMessage: {})
}
