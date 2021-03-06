//
//  Round.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI
import FirebaseFirestore


class Round: ObservableObject{
    let db = Firestore.firestore()
    @EnvironmentObject var screen:ScreenController
    
    var collectionArr: [String] = []
    var cAIndex: Int
    
    var r:Int //round number
    var playerSpinning:Player
    var otherPlayer:Player
    var qIndex:Int //index of current Question

    var choiceSelected:Int //index of the answer selected
    
    @Published var blitzAvail:Bool = false
    @Published var blitzOn:Bool = false
    @Published var roundContinue:Bool = true
    @Published var gameOver:Bool = false
    @Published var roundScore:Int //stores player's current round score
    @Published var gameScore:Int //stores player's current gamescore
    @Published var opRoundScore:Int //Other players round score
    @Published var opGameScore:Int //Other players gamescore
    @Published var roundResult:String
    @Published var gameResult:String
    @Published var answerStreak:Int
    @Published var strikes:Int //keeps track of how many wrong answers the player got wrong in the round
    
    @Published var questArr: [String] = []
    @Published var corrAnsArr = [String]()
    @Published var wrong1Arr = [String]()
    @Published var wrong2Arr = [String]()
    @Published var wrong3Arr = [String]()
    @Published var displayAns = [String]()
    
    init(p1: Player, p2: Player, r: Int) {
        self.collectionArr = ["mlb-questions","nfl-colleges","nfl-questions","nba-colleges", "nba-questions"]
        self.cAIndex = 0
        self.blitzAvail = false
        self.blitzOn = false
        self.roundContinue = true
        self.gameOver = false
        self.playerSpinning = p1
        self.otherPlayer = p2
        self.r = r
        self.qIndex = 0
        self.roundScore = 0
        self.gameScore = 0
        self.opGameScore = 0
        self.strikes = 0
        self.opRoundScore = 0
        self.roundResult = ""
        self.gameResult = ""
        self.answerStreak = 0
        self.choiceSelected = -1 //-1 before an answer is selected
        
        //All of the arrays involoving questions/answers initialized below
        self.questArr = [String](repeating: "", count: 100)
        self.corrAnsArr = [String](repeating: "", count: 100)
        self.wrong1Arr = [String](repeating: "", count: 100)
        self.wrong2Arr = [String](repeating: "", count: 100)
        self.wrong3Arr = [String](repeating: "", count: 100)
        self.displayAns = [String](repeating: "", count: 4)
        generateQuestions(category: collectionArr[0])
        
    }
    
    func spinWheel(){
        //playerSpinning will omit a category and spin the wheel
        //The category will be returned
        
    }
    
    func generateQuestions(category: String){ // based on the players spin, will generate 20 randomized questions of that category
        var qArr = [String]()
        var cArr = [String]()
        var wArr1 = [String]()
        var wArr2 = [String]()
        var wArr3 = [String]()
        
        //db.collection("nfl-questions").getDocuments() { (querySnapshot, err) in
        db.collection(category).getDocuments() { (querySnapshot, err) in
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
    
    
    func endRound(){
        self.opRoundScore = Int(arc4random_uniform(13) + 2) //for testing purposes generates a random score between 2 and 14
        if (self.roundScore > self.opRoundScore){
            self.gameScore+=1
            self.roundResult = "Winner"
        }
        else if(self.roundScore < self.opRoundScore){
            self.opGameScore+=1
            self.roundResult = "Loser"
        }
        else{ self.roundResult = "Tie" }
        
        if(self.gameScore == 3){
            self.gameResult = "Winner!"
            gameOver = true
        }
        else if(self.opGameScore == 3){
            self.gameResult = "Tough Loss..."
            gameOver = true
        }
        else if((self.gameScore != 3 && self.opGameScore != 3) && self.r == 5){
            self.gameResult = "Game was tied"
            gameOver = true
        }
        else{
            roundContinue = false //this lets question screen know that the round has ended.
        }
    }
    
    func selectAns(){
        if displayAns[choiceSelected] == corrAnsArr[qIndex]{
            if blitzOn == true{
                roundScore+=2
            }
            else{
                roundScore+=1
                answerStreak+=1
                if answerStreak == 5 && blitzAvail == false{
                    blitzAvail = true
                }
            }
        }
        else{
            blitzOn = false
            answerStreak = 0
            strikes+=1
        }
        
        if qIndex < 19 && strikes < 3{
            qIndex+=1
            self.displayAns = [self.corrAnsArr[self.qIndex], self.wrong1Arr[self.qIndex], self.wrong2Arr[self.qIndex], self.wrong3Arr[self.qIndex]]
                self.displayAns.shuffle() //randomizes the order of the array answers
        }
        else{
            self.qIndex = 0
            if cAIndex < 4{
                cAIndex+=1
                generateQuestions(category: self.collectionArr[cAIndex])
            }
            self.displayAns = [self.corrAnsArr[self.qIndex], self.wrong1Arr[self.qIndex], self.wrong2Arr[self.qIndex], self.wrong3Arr[self.qIndex]]
            self.displayAns.shuffle() //randomizes the order of the array answers
            self.endRound()
        }
    }
    
    
}
