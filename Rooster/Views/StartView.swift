//
//  StartView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct StartView: View {
    @State var showSignUp = false
    
    var body: some View {
            ZStack {
                GifImage()

                VStack {
                    HStack {
                        Image("Icon")
                            .offset(x: -95, y: 15)
                            .scaleEffect(CGSize(width: 0.8, height: 0.8))
                        Text("Rooster")
                            .font(.system(size: 35, weight: .bold))
                            .foregroundColor(.white)
                            .offset(x: -150, y: 0)
                    }
                    
                    HStack {
                        Text("Shoe fashion for you")
                            .font(.system(size: 30, weight: .semibold))
                            .foregroundColor(.white)
                            .offset(x: -30, y: -80)
                    }
                    
                    ScreenText()
                    
                    VStack {
                        Button(action: {
                            goHome()
                        }, label: {
                            Text("Sign In")
                                .frame(width: 330, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 25))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(UIColor(red: 0.451, green: 0, blue: 0.6275, alpha: 1.0)))
                        })
                        .cornerRadius(10)
                        
                        Button(action: {
                            self.showSignUp.toggle()
                        }, label: {
                            Text("Sign Up")
                                .frame(width: 330, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                
                                .font(.system(size: 25))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color(UIColor.white))
                        })
                        .cornerRadius(10)
                        .sheet(isPresented: $showSignUp, content: {
                            SignUpView()
                        })
                }
                    .frame(width: 300, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: 0, y: -70)
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}

struct GifImage: View{
    var body: some View{
        return
            GeometryReader {geometry in
            ZStack {
                StartAnimatedBgView(fileName: "giphy")
                    .aspectRatio(geometry.size, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ScreenText: View{
    var body: some View{
        GeometryReader { geometry in
            Text("Log in for a journey through our world.")
                .foregroundColor(.white)
                .font(.system(size: 35, weight: .semibold))
                .frame(width: geometry.size.width - 50, height: geometry.size.height, alignment: .bottom)
                .offset(x: 0, y: -130.0)
        }
    }
}

func goHome() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}
