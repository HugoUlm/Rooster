//
//  StartView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct StartView: View {
    @State var showSignUp = false
    @State var showSignIn = false
    
    var body: some View {
            ZStack {
                GifImage()

                VStack {
                    HStack {
                        // Logo
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
                        // On click SignInView shows
                        Button(action: {
                            self.showSignIn.toggle()
                        }, label: {
                            Text("Sign In")
                                .frame(width: 330, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 26))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(UIColor(red: 0.451, green: 0, blue: 0.6275, alpha: 1.0)))
                        })
                        .sheet(isPresented: $showSignIn, content: {
                            SignInView(user: CustomerModel.init(id: "", email: "", firstName: "", lastName: "", passwordHash: "", country: "", gender: "", dateOfBirth: Date()))
                        })
                        // On click SignUpView shows
                        Button(action: {
                            self.showSignUp.toggle()
                        }, label: {
                            Text("  Sign Up")
                                .frame(width: 330, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .font(.system(size: 25))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .padding()
                                .background(Color(UIColor.white))
                        })
                        .border(Color.black, width: 2)
                        .sheet(isPresented: $showSignUp, content: {
                            SignUpView(customer: CustomerModel.init(id: "", email: "", firstName: "", lastName: "", passwordHash: "", country: "", gender: "", dateOfBirth: Date()))
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

// Displays gif as background
struct GifImage: View{
    var body: some View{
        return
            GeometryReader {geometry in
            ZStack {
                StartAnimatedBgView(fileName: "giphy")
                    .aspectRatio(1, contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .offset(x: -150, y: 0)
            }
        }
    }
}

// Displays text
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

// Function to view SignInView
func goHome() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: SignInView(user: CustomerModel.init(id: "", email: "", firstName: "", lastName: "", passwordHash: "", country: "", gender: "", dateOfBirth: Date())))
        window.makeKeyAndVisible()
    }
}
