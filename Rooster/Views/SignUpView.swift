//
//  SignUpView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct SignUpView: View {
    
    //var customerModel: CustomerModel
    @State public var customer: CustomerModel
    @State private var keyboardOffset: CGFloat = 0
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("USER DETAILS")){
                        VStack {
                            Group {
                                TextField("Email", text: $customer.email)
                                Divider()
                                SecureField("Password", text: $customer.passwordHash)
                                Divider()
                                TextField("First Name", text: $customer.firstName)
                                Divider()
                                TextField("Last Name", text: $customer.lastName)
                                }
                            
                            Group {
                                Divider()
                                TextField("Gender", text: $customer.gender)
                                Divider()
                                Picker(selection: $customer.country,
                                    label: Text("Country")) {
                                    ForEach(CountryModel.names, id: \.self) { country in
                                        Text(country).tag(country)
                                    }
                                }
                                Divider()
                                DatePicker("Date of Birth", selection: $customer.dateOfBirth, displayedComponents: [.date])
                            }
                        }
                    }

                    Section(header: Text("SUBMIT")) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Register")
                        })
                    }
                }
                .navigationTitle("Register")
                .offset(y: -self.keyboardOffset)
                .onAppear {
                    NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification,
                                                           object: nil,
                                                           queue: .main) { (notification) in
                                                            NotificationCenter.default.addObserver(
                                                                forName: UIResponder.keyboardDidShowNotification,
                                                                object: nil,
                                                                queue: .main) { (notification) in
                                                                    guard let userInfo = notification.userInfo,
                                                                        let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                                                                    
                                                                    self.keyboardOffset = keyboardRect.height
                                                        }
                                                            
                                                            NotificationCenter.default.addObserver(
                                                                forName: UIResponder.keyboardDidHideNotification,
                                                                object: nil,
                                                                queue: .main) { (notification) in
                                                                    self.keyboardOffset = 0
                                                        }
                    }
                }
            }
        }
        .background(Color(UIColor.systemGray6))
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(customer: CustomerModel.init(id: UUID(), email: "", firstName: "", lastName: "", passwordHash: "", country: "", gender: "", dateOfBirth: Date()))
    }
}
