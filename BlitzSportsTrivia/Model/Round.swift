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
    var qIndex:Int //index of current Question

    var choiceSelected:Int //index of the answer selected
    
    
    var roundScore:Int
    var answerStreak:Int
    
    var questArr: [String] = []
    var corrAnsArr = [String]()
    var wrong1Arr = [String]()
    var wrong2Arr = [String]()
    var wrong3Arr = [String]()
    var displayAns = [String]()
    
    init(p1: Player, p2: Player, r: Int) {
        self.playerSpinning = p1
        self.otherPlayer = p2
        self.r = r
        self.qIndex = 0
        self.roundScore = 0 //stores player's current round score
        self.answerStreak = 0
        self.choiceSelected = -1 //-1 before an answer is selected
        
        //All of the arrays involoving questions/answers initialized below
        self.questArr = [String](repeating: "", count: 100)
        self.corrAnsArr = [String](repeating: "", count: 100)
        self.wrong1Arr = [String](repeating: "", count: 100)
        self.wrong2Arr = [String](repeating: "", count: 100)
        self.wrong3Arr = [String](repeating: "", count: 100)
        self.displayAns = [String](repeating: "", count: 4)
        generateQuestions()
        
    }
    
    func spinWheel(){
        //playerSpinning will omit a category and spin the wheel
        //The category will be returned
        
    }
    
    func generateQuestions(){ // based on the players spin, will generate 20 randomized questions of that category
        var qArr = [String]()
        var cArr = [String]()
        var wArr1 = [String]()
        var wArr2 = [String]()
        var wArr3 = [String]()
        
        db.collection("nfl-questions").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    qArr.append(document.get("Question") as! String)
                    //print(document.get("Question") as! String)
                    cArr.append(document.get("CorrectAnswer") as! String)
                    wArr1.append(document.get("WrongAnswer1") as! String)
                    wArr2.append(document.get("WrongAnswer2") as! String)
                    wArr3.append(document.get("WrongAnswer3") as! String)
                }
            }
            
            //must set question and answer Arrays here because firebase has an asynchronous nature
            self.questArr = qArr
            self.corrAnsArr = cArr
            self.wrong1Arr = wArr1
            self.wrong2Arr = wArr2
            self.wrong3Arr = wArr3
            print(self.wrong1Arr[0])
            self.displayAns = [self.corrAnsArr[0], self.wrong1Arr[0], self.wrong2Arr[0], self.wrong3Arr[0]]
            
            print(self.displayAns[0])
            self.displayAns.shuffle() //randomizes the order of the array answers
        }
    }
    
    func selectAns(){
        if displayAns[choiceSelected] == corrAnsArr[qIndex]{
            roundScore+=1
            answerStreak+=1
        }
        else{
            answerStreak = 0
        }
        
        if qIndex < 19{
            qIndex+=1
            self.displayAns = [self.corrAnsArr[self.qIndex], self.wrong1Arr[self.qIndex], self.wrong2Arr[self.qIndex], self.wrong3Arr[self.qIndex]]
                self.displayAns.shuffle() //randomizes the order of the array answers
        }
    }
    
    
}
