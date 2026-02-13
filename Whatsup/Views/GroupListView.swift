//
//  GroupListView.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 28/01/26.
//

import SwiftUI

struct GroupListView: View {
    
    let groups: [Group]
    
    var body: some View {
        List(groups) { group in
            
            NavigationLink {
                GroupDetailView(group: group)
            } label: {
                HStack {
                    Image(systemName: "person.2")
                    Text(group.subject)
                }
            }
        }
    }
}

#Preview {
    GroupListView(groups: [])
}
