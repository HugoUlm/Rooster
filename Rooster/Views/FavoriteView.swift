//
//  FavoriteView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Favorites")
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
