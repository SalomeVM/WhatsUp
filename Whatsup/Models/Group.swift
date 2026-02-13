//
//  Group.swift
//  Whatsup
//
//  Created by Salome Vizcarra on 23/01/26.
//

import Foundation
import FirebaseFirestore

struct Group: Codable, Identifiable{
    var documentID: String? = nil
    let subject: String
    
    var id: String {
        documentID ?? UUID().uuidString
    }
}

extension Group {
    func toDisctionarty() -> [String: Any] {
        ["subject": subject]
    }
    
    static func fromSnapshot(snapshot: QueryDocumentSnapshot) -> Group? {
        let dictionary = snapshot.data()
        guard let subject = dictionary["subject"] as? String else { return nil }
        
        return Group(documentID: snapshot.documentID, subject: subject)
        
    }
}
