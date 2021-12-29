//
//  SignInView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct SignInView: View {
    
    @State public var user: CustomerModel
    @ObservedObject var viewModel = SignInViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Input for email
                TextField("Email", text: $user.email)
                    .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(Color(UIColor.white))
                    .disableAutocorrection(true)
                
                // Input for password
                SecureField("Password", text: $user.passwordHash)
                    .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                    .background(Color(UIColor.white))
                    .offset(x: 0, y: 10)
                
                Button(action: {
                    // Check if email and password field is not empty
                    guard modelStateIsValid
                    else {
                        return
                    }
                    
                    viewModel.signIn(email: user.email, password: user.passwordHash)
                    
                    if viewModel.signedIn {
                        loggedIn()
                    }
                }, label: {
                    Text("Sign In")
                        .frame(width: 310, height: 30)
                        .font(.system(size: 26))
                        .multilineTextAlignment(.center)
                })
                .foregroundColor(.white)
                .padding()
                .background(Color(UIColor(red: 0.451, green: 0, blue: 0.6275, alpha: 1.0)))
                .offset(x: 0, y: 20)
            }
            .navigationTitle("Sign In")
            .offset(x: 0, y: -200)
        }
        .onAppear {
            viewModel.signedIn = viewModel.isSignedIn
        }
    }
    
    var modelStateIsValid: Bool {
        return !user.email.isEmpty && !user.passwordHash.isEmpty
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(user: CustomerModel.init(id: "", email: "", firstName: "", lastName: "", passwordHash: "", country: "", gender: "", dateOfBirth: Date()))
    }
}

func loggedIn() {
    if let window = UIApplication.shared.windows.first {
        window.rootViewController = UIHostingController(rootView: ContentView())
        window.makeKeyAndVisible()
    }
}
