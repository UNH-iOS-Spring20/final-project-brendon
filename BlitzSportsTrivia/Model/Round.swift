//
//  Round.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

class Round{
    let db = Firestore.firestore()
    
    var r:Int //round number
    var playerSpinning:Player
    var otherPlayer:Player
    //var ref = Database.database().reference()
    
    //var testQuest:String = "Hello There"
    
    var questArr: [String] = []
    var corrAnsArr = [String]()
    var wrong1Arr = [String]()
    var wrong2Arr = [String]()
    var wrong3Arr = [String]()
    
    init(p1: Player, p2: Player, r: Int) {
        self.playerSpinning = p1
        self.otherPlayer = p2
        self.r = r
        self.questArr = [String](repeating: "", count: 100)
        generateQuestions()
        
    }
    
    func spinWheel(){
        //playerSpinning will omit a category and spin the wheel
        //The category will be returned
        
    }
    
    func generateQuestions(){ // based on the players spin, will generate 20 randomized questions of that category
        var arr = [String]()
        /*let nflQRef = db.collection("nfl-questions").document("0")
         nflQRef.getDocument { (document, error) in
         if let document = document, document.exists {
         //let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
         //print("Document data: \(dataDescription)")
         arr.append(document.get("Question") as! String)
         } else {
         print("Document does not exist")
         }*/
        
        db.collection("nfl-questions").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    arr.append(document.get("Question") as! String)
                    print(document.get("Question") as! String)
                    
                }
            }
            
            self.questArr = arr //must set questArr here because firebase has an asynchronous nature
            
        }
        //print("qA[15]: ", questArr[15])
    }
    
    
    
    
}
