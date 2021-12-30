//
//  StoreViewModel.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-28.
//

import SwiftUI
import Foundation
import FirebaseFirestore
import FirebaseStorage

class StoreViewModel: ObservableObject {
    
    @Published var products = [ProductModel]()

    func getProducts() {
        // Get reference
        let db = Firestore.firestore()
        
        // Read data
        db.collection("products").getDocuments {  snapshot, error in
            // Check for error
            if error == nil {
                // No error
                
                if let snapshot = snapshot {
                    
                    DispatchQueue.main.async {
                        // Get all docs and create customer
                        self.products = snapshot.documents.map { doc in
                            
                            // Create new customer for each doc
                            return ProductModel(id: doc.documentID, brand: doc["brand"] as? String ?? "", model: doc["model"] as? String ?? "", price: doc["price"] as? Int ?? 0, sizes: doc["sizes"] as? [Int] ?? [0], image: doc["image"] as? String ?? "No image")
                        }
                    }
                }
            }
            else {
                // Handle error
                
            }
        }
    }
    
    @Published var dataIsValid = false
    var data:Data?

    // Fetches image from Firebase Storage via URL
    func loadImage(url: String) {
        // Set reference
        let imageRef = Storage.storage().reference(forURL: url)
        // Make sure file is < 1MB
        imageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            // Catch error
            if let error = error {
                print("\(error)")
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                print(self.dataIsValid)
                self.dataIsValid = true
                self.data = data
            }
        }
    }
    // Create image from data in "loadImage" func
    func imageFromData() -> UIImage {
        UIImage(data: self.data!)!
    }
}
