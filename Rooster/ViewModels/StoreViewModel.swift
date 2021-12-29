//
//  StoreViewModel.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-28.
//

import Foundation
import Firebase
import FirebaseFirestore

class StoreViewModel: ObservableObject {
    @Published var products = [ProductModel]()
    
    func getCustomers() {
        // Get reference
        let db = Firestore.firestore()
        
        // Read data
        db.collection("customers").getDocuments {  snapshot, error in
            // Check for error
            if error == nil {
                // No error
                
                if let snapshot = snapshot {
                    
                    // Get all docs and create customer
                    //self.products = snapshot.documents.map { doc in
                        
                        // Create new customer for each doc
//                        return CustomerModel(id: doc.documentID, email: doc["email"] as? String ?? "", firstName: doc["firstName"] as? String ?? "", lastName: doc["lastName"] as? String ?? "", passwordHash: doc["passwordHash"] as? String ?? "", country: doc["country"] as? String ?? "", gender: doc["gender"] as? String ?? "", dateOfBirth: doc["dateOfBirth"] as? Date ?? Date.distantPast)
                    }
                }
            }
            //else {
                // Handle error
                
            //}
        }
    }
//}
