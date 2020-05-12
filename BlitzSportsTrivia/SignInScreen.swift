//
//  SignInScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 5/11/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct SignInScreen: View {
    @State var email:String = ""
    @State var password:String = ""
    @State var error = false
    @EnvironmentObject var core:Core
    @EnvironmentObject var screen:ScreenController
    func signIn(){
        print("SCREEN: \(screen.screen)")
        error = false
        core.signIn(email: email, password: password) {
            (result, error) in
            if error != nil {
                print(" HERE: \(String(describing: error))")
                self.error = true
            } else{
                print("MADE IT TO ELSE")
                self.email = ""
                self.password = ""
            }
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Enter your email and password")){
                        TextField("Email",text: $email)
                        SecureField("Password", text: $password)
                    }.navigationBarTitle("Log In")
                    Button(action: {
                        self.signIn()
                        self.core.isSetup = true
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.screen.mSButton()
                    }) {
                    Text("Sign In")
                    }
                }
            }
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
