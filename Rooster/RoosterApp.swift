//
//  RoosterApp.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI
import Firebase

@main
struct RoosterApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}
