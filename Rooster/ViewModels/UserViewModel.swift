//
//  UserViewModel.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-29.
//

import Foundation
import FirebaseAuth

class UserViewModel: ObservableObject {
    
    var email = Auth.auth().currentUser?.email
    var name = Auth.auth().currentUser?.displayName
}
