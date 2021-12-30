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
    
    func emailValidator(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}
