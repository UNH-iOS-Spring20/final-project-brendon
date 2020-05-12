//
//  SignUpScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 5/11/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct SignUpScreen: View {
    @State var email:String = ""
    @State var password:String = ""
    @State private var error = false
    
    @EnvironmentObject var core:Core
    @EnvironmentObject var screen:ScreenController
    
    func signUp(){
        print("Signing Up...")
        error = false
        
        core.signUp(email: email, password: password) {
            (result, error) in
            if error != nil {
                print("\(String(describing: error))")
                self.error = true
            }else{
                self.email = ""
                self.password = ""
            }
        }
    }
    var body: some View {
        NavigationView{
            VStack{
                Form{
                    Section(header: Text("Account Information")){
                        TextField("Email",text: $email)
                        SecureField("Password", text: $password)
                    }.navigationBarTitle("Sign Up")
                    Button(action: {
                        self.signUp()
                        self.core.isSetup = true
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        self.screen.mSButton()
                        self.core.profile?.email = self.email
                    }) {
                    Text("Sign Up")
                    }
                }
            }
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
