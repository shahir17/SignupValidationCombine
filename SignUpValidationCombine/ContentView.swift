//
//  ContentView.swift
//  SignUpValidationCombine
//
//  Created by Ahmad Shahir Abdul Satar on 7/7/21.
//

import SwiftUI
import Combine


struct ContentView: View {
    @StateObject private var formViewModel = FormViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("USERNAME")) {
                        TextField("Username", text: $formViewModel.userName)
                            .autocapitalization(.none)
                    }
                    Section(header: Text("PASSWORD"), footer: Text(formViewModel.inlineErrorForPassword).foregroundColor(.red)) {
                        SecureField("Password", text: $formViewModel.password)
                        SecureField("Password Again", text: $formViewModel.passwordAgain)
                    }
                }
                Button(action: {} ) {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(height: 60)
                        .overlay(
                        Text("Continue")
                            .foregroundColor(.white)
                        )
                }.padding().disabled(!formViewModel.isValid)
            }.navigationTitle("Sign Up")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
