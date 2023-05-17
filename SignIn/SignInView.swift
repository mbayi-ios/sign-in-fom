//
//  SignInView.swift
//  SignIn
//
//  Created by Amby on 17/05/2023.
//

import SwiftUI

struct SignInView: View {
    @ObservedObject var viewModel: SignViewModel

    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Email")
                TextField("Email", text: $viewModel.email)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)
                    .disableAutocorrection(true)
                
                Text("Password")
                SecureField("Password", text: $viewModel.password)
            }
            .disabled(viewModel.isSigningIn)

            if viewModel.isSigningIn {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                Button("sign In") {
                    print("Sign in")
                    viewModel.signIn()
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.borderedProminent)
                .disabled(!viewModel.canSignIn)
            }
            Spacer()
        }
        .padding()
        .textFieldStyle(.roundedBorder)
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Sign in Failed"),
                  message: Text("The email/password combination is invalid"))
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignViewModel())
    }
}
