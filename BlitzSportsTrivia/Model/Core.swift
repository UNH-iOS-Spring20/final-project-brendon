//
//  Core.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 5/11/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import Combine
import CloudKit
import Foundation
import FirebaseAuth

class Core:ObservableObject{
    @Published var isSetup:Bool?
    var didChange = PassthroughSubject<Core, Never>()
    @Published var profile: Profile? { didSet { self.didChange.send(self) }}
    var handle: AuthStateDidChangeListenerHandle?
    let user = Auth.auth().currentUser
    
    func listen(){
        //monitor authentication change with firebase
        handle = Auth.auth().addStateDidChangeListener{ (auth,user) in
            if let user = user{
                print("Get user: \(user)")
                self.profile = Profile(id: user.uid, email: user.email!)
            }else{
                // if we don't have a user set our session to nil.
                self.profile = nil
            }
        }
    }
    
    func createUser(email: String, password: String, _ callback: ((Error?)->())? = nil ){
        Auth.auth().createUser(withEmail: email, password: password){
            (user, error) in
            if let e = error{
                callback? (e)
                return
            }
            callback?(nil)
            print("Account Creation Successful")
        }
    }
    
    func login(email: String, password: String, _ callback: ((Error?)->())? = nil ){
        Auth.auth().signIn(withEmail: email, password: password){
            (user, error) in
            if let e = error{
                callback? (e)
                return
            }
            callback?(nil)
            print("Login successful")
        }
    }
    
    func signUp(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ){
        print("Reached")
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
        print("Sign up success")
    }
    func signIn(
        email: String,
        password: String,
        handler: @escaping AuthDataResultCallback
    ){
        print("Attempting to sign in")
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
        print("Sign in success")
    }
    
    func signOut () -> Bool {
        do {
            try Auth.auth().signOut()
            self.profile = nil
            return true
        } catch {
            return false
        }
    }
}




class Profile:ObservableObject{
    var id:String?
    var email:String?
    
    init(id:String, email:String)
    {
        self.id = id
        self.email = email
    }
}
