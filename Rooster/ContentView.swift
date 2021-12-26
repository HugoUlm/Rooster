//
//  ContentView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct ContentView: View {
    
    @State var slideBar = false
    @State var selectedIndex = 0
    
    let icons = [
        "house",
        "magnifyingglass",
        "heart",
        "cart",
        "person"
    ]
    
    let iconNames = [
        "Home",
        "Search",
        "Favorites",
        "Cart",
        "Profile"
    ]
    
    var body: some View {
        VStack {
            // Content
            ZStack {
                switch selectedIndex {
                case 0:
                    HomeView()
                case 1:
                    SearchView()
                case 2:
                    FavoriteView()
                case 3:
                    CartView()
                default:
                    UserView()
                }
            }

            Divider()
            
            HStack {
                ForEach(0..<5, id: \.self) {number in
                    Spacer()
                    Button(action: {
                        withAnimation {
                            self.slideBar.toggle()
                        }
                        self.selectedIndex = number
                    }, label: {
                        VStack {
                            Rectangle()
                                .frame(width: 62, height: 5, alignment: .center)
                                .offset(x: 0, y: -15)
                                .foregroundColor(selectedIndex == number ? Color(UIColor(red: 0.451, green: 0, blue: 0.6275, alpha: 1.0)) : Color(UIColor.white))
                                .transition(.slide)
                            
                            Image(systemName: icons[number])
                                .font(.system(size: 25, weight: .regular, design: .default))
                                .foregroundColor(selectedIndex == number ? Color(UIColor(red: 0.451, green: 0, blue: 0.6275, alpha: 1.0)) : Color(UIColor.lightGray))
            
                            Text(iconNames[number])
                                .font(.system(size: 10, weight: .regular, design: .default))
                                .foregroundColor(selectedIndex == number ? Color(UIColor(red: 0.451, green: 0, blue: 0.6275, alpha: 1.0)) : Color(UIColor.lightGray))
                        }
                    })
                    Spacer()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
        }
    }
}
