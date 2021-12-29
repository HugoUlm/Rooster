//
//  SignUpViewModel.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-28.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class SignUpViewModel: ObservableObject {
    @Published var genders = [
        "Male",
        "Female"
    ]
    
    @Published var countries = [
        "Sweden",
        "USA",
        "Germany"
    ]
    
    var viewModel = SignInViewModel()
    
    func addCustomer(customer: CustomerModel) {
        
        // Get refernce
        let db = Firestore.firestore()
        
        // Add document to collection
        db.collection("customers").addDocument(data: ["email": customer.email, "firstName": customer.firstName, "lastName": customer.lastName, "gender": customer.gender, "country": customer.country, "dateOfBirth": customer.dateOfBirth]) { error in
            
            // Check for error
            if error == nil {
                // No error
                Auth.auth().createUser(withEmail: customer.email, password: customer.passwordHash) { result, authError in
                    guard result != nil, authError == nil
                    else {
                        return print(authError.debugDescription)
                    }
                }
            }
            else {
                // Handle error
            }
        }
    }
}
