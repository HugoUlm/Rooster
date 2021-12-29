//
//  SignInViewModel.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-28.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class SignInViewModel: ObservableObject {
    
    // Set reference
    let auth = Auth.auth()
    
    // Check if user is signed in
    var isSignedIn: Bool {
        return auth.currentUser != nil
    }
    
    @Published var signedIn = false
    
    // Sign in with email and password
    func signIn(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { result, error in
            
            guard result != nil, error == nil
            else {
                return
            }
            
            // Success
            self.signedIn = true
        }
    }
}
