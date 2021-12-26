//
//  HomeView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                Text(Date(), style: .date)
                    .offset(x: -103, y: 0)

                VStack(alignment: .leading)
                {
                    ZStack {
                        Image("nike")
                            .resizable()
                            .scaledToFit()
                        Text("NIKE")
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .font(.system(size: 50, weight: .bold))
                            .frame(width: 190, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                            .offset(x: -70, y: -220)
                        Text("BROWSE OUR COLLECTION")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(width: 250, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                            .offset(x: -40, y: 220)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Shop")
                                .frame(width: 90, height: 20, alignment: .center)
                                .padding()
                                .background(Color(UIColor.black))
                                .foregroundColor(.white)
                                
                        })
                        .cornerRadius(30)
                        .offset(x: -110, y: 230)
                    }
                    
                    ZStack {
                        Image("vans")
                            .resizable()
                            .scaledToFit()
                        Text("VANS")
                            .foregroundColor(.white)
                            .opacity(0.6)
                            .font(.system(size: 50, weight: .bold))
                            .frame(width: 190, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                            .offset(x: -70, y: -220)
                        Text("SEE NEW RELEASES")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(width: 190, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: .topLeading)
                            .offset(x: -70, y: 220)
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("View")
                                .frame(width: 90, height: 20, alignment: .center)
                                .padding()
                                .background(Color(UIColor.black))
                                .foregroundColor(.white)
                                
                        })
                        .cornerRadius(30)
                        .offset(x: -110, y: 230)
                    }
                    


                    
                }
                .navigationTitle("Discover")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
