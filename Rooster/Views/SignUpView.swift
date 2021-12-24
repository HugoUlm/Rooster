//
//  SignUpView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var email: String = ""
    
    var body: some View {
        HStack(alignment: .top) {
            Text("Rooster")
                .font(.system(size: 30))
                .offset(x: -120, y: -300)
        }
        VStack(alignment: .center) {
            TextField("Email Address", text: $email)
                .disableAutocorrection(true)
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
