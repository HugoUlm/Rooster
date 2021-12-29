//
//  SignUpView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct SignUpView: View {

    @State public var customer: CustomerModel
    @State private var keyboardOffset: CGFloat = 0
    @State private var selectedIndex = 0
    @State var valueGender = ""
    @State var valueCountry = ""
    var placeholderGender = "Gender"
    var placeholderCountry = "Country"
    @State var checked = false
    
    @ObservedObject var viewModel = SignUpViewModel()
    
    var body: some View {
            NavigationView {

                        VStack {
                            // Input for email
                            TextField("Email", text: $customer.email)
                                .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .background(Color(UIColor.white))
                                .disableAutocorrection(true)
                            // Input for password
                            SecureField("Password", text: $customer.passwordHash)
                                .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .background(Color(UIColor.white))
                                .offset(x: 0, y: 10)
                            // Input for first name
                            TextField("First name", text: $customer.firstName)
                                .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .background(Color(UIColor.white))
                                .disableAutocorrection(true)
                                .offset(x: 0, y: 20)
                            // Input for last name
                            TextField("Last name", text: $customer.lastName)
                                .frame(width: 350, height: 50, alignment: .center)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .background(Color(UIColor.white))
                                .disableAutocorrection(true)
                                .offset(x: 0, y: 30)
                            // Dropdown for gender
                            Menu {
                                ForEach(viewModel.genders, id: \.self) { gender in
                                    Button(gender) {
                                        self.valueGender = gender
                                        customer.gender = gender
                                    }
                                }
                            }
                            
                            label: {
                                VStack(spacing: 5) {
                                    HStack {
                                        Text(valueGender.isEmpty ? placeholderGender : valueGender)
                                            .foregroundColor(valueGender.isEmpty ? Color(UIColor.lightGray) : .black)
                                            .offset(x: -7, y: 0)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.black)
                                            .font(Font.system(size: 15, weight: .bold))
                                    }
                                    .padding()
                                    .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                    .background(Color(UIColor.white))
                                    
                            }
                                .frame(width: 350, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            }
                            .offset(x: 0, y: 40)
                            // Dropdown for country
                            Menu {
                                ForEach(viewModel.countries, id: \.self) { country in
                                    Button(country) {
                                        self.valueCountry = country
                                        customer.country = country
                                    }
                                }
                            }
                            label: {
                                VStack(spacing: 5) {
                                    HStack {
                                        Text(valueCountry.isEmpty ? placeholderCountry : valueCountry)
                                            .foregroundColor(valueCountry.isEmpty ? Color(UIColor.lightGray) : .black)
                                            .offset(x: -7, y: 0)
                                        Spacer()
                                        Image(systemName: "chevron.down")
                                            .foregroundColor(.black)
                                            .font(Font.system(size: 15, weight: .bold))
                                    }
                                    .padding()
                                    .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                    .background(Color(UIColor.white))
                                    
                                }
                                .frame(width: 350, height: 50, alignment: .center)
                            }
                            .offset(x: 0, y: 50)
                            // Input for Date of Birth
                            DatePicker("Date of Birth", selection: $customer.dateOfBirth, displayedComponents: [.date])
                                .frame(width: 317, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .foregroundColor(Color(UIColor.lightGray))
                                .padding()
                                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                                .offset(x: 0, y: 60)
                            
                            // Checkbox for terms and conditions
                            Toggle(isOn: $checked) {
                                Text("Accept Terms and Conditions")
                                    .foregroundColor(.black)
                                    .offset(x: -25, y: 10)
                            }
                            .toggleStyle(CheckboxToggleStyle())
                            .font(.system(size: 24))
                            .offset(x: 0, y: 70)
                            
                            // Submit button
                            VStack {
                                Button(action: {
                                    
                                    // Check if none of models props are null
                                    if modelStateIsValid {
                                        if customer.passwordHash.count < 6 {
                                            return
                                        }
                                        else {
                                            viewModel.addCustomer(customer: customer)
                                            goHome()
                                        }
                                    }
                                }, label: {
                                    Text("Register")
                                        .frame(width: 310, height: 30)
                                        .font(.system(size: 26))
                                        .multilineTextAlignment(.center)
                                })
                                .disabled(!modelStateIsValid)
                                .foregroundColor(.white)
                                .padding()
                                .background(buttonColorBackGround)
                            }
                            .offset(x: 0, y: 80)
                        }


                        .offset(x: 0, y: -50)
                        .background(Color(UIColor.white))
                        .navigationTitle("Register")
                        // Following code will make the keyboard not overlap textfield
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
                                                                            
                                                        NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification,
                                                                                               object: nil,
                                                                                                    queue: .main) { (notification) in
                                                        self.keyboardOffset = 0
                                                        }
                }
            }
        }
    }
    // Checks if customer props are not null
    var modelStateIsValid: Bool {
        return !customer.email.isEmpty && !customer.firstName.isEmpty && !customer.lastName.isEmpty && !customer.passwordHash.isEmpty && !customer.gender.isEmpty && !customer.country.isEmpty
    }
    // Changes color of button background depending on modelStateIsValid
    var buttonColorBackGround: Color {
        return modelStateIsValid ? Color(UIColor(red: 0.451, green: 0, blue: 0.6275, alpha: 1.0)) : Color(UIColor.lightGray)
    }
    // Changes color of button text depending on modelStateIsValid
    var buttonColorForeGround: Color {
        return modelStateIsValid ? Color.white : Color.black
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(customer: CustomerModel.init(id: "", email: "", firstName: "", lastName: "", passwordHash: "", country: "", gender: "", dateOfBirth: Date()))
    }
}

// Adding new togglestyle that enables checkbox
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack {

            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 28, height: 28)
                .offset(x: -27, y: 10)
                .onTapGesture { configuration.isOn.toggle() }
            
            configuration.label
        }
    }
}
