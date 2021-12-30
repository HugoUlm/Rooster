//
//  UserView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct UserView: View {
    
    @ObservedObject var viewModel = UserViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Text")
            }
            .navigationTitle(viewModel.email ?? "Username")
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}
