//
//  CustomerModel.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import Foundation


struct Customer : Identifiable {
    var id = UUID()
    var email: String
    var firstName: String
    var lastName: String
    var passwordHash: String
    var country: String
    var gender: String
    var dateOfBirth: String
}
