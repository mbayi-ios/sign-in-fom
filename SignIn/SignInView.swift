//
//  SignInView.swift
//  SignIn
//
//  Created by Amby on 17/05/2023.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Email")
                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                
                Text("Password")
                SecureField("Password", text: $password)
            }
            Button("sign In") {
                print("Sign in")
            }
            .buttonBorderShape(.capsule)
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
        .textFieldStyle(.roundedBorder)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
