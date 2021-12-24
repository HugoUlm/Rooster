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
                    ScreenText()
                    
                    HStack {
                        Button(action: {
                            self.showSignUp.toggle()
                        }, label: {
                            Text("Sign Up")
                                .frame(width: 150, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color(UIColor.white))

                        })
                        .cornerRadius(30)
                        .sheet(isPresented: $showSignUp, content: {
                            SignUpView()
                        })
                        

                        
                        Button(action: {
                            goHome()
                        }, label: {
                            Text("Sign In")
                                .frame(width: 150, height: 30, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(UIColor(red: 0.451, green: 0, blue: 0.6275, alpha: 1.0)))
                        })
                        .cornerRadius(30)
                }
                    .frame(width: 300, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: 0, y: -30)
                    

                    
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
            Text("Join our community to take part of our extrodinary products.")
                .foregroundColor(.white)
                .font(.system(size: 35, weight: .semibold))
                .frame(width: geometry.size.width - 100, height: geometry.size.height, alignment: .bottom)
                .offset(x: 0, y: -60.0)
        }
    }
}

func goHome() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}
