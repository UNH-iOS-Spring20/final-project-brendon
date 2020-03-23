//
//  Player.swift
//  BlitzSportsTrivia
//
//  Created by Brendon Malouf on 2/17/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

class Player{
    //The following constants xp required to level up
    let maxLevelXP1 = 5000 //5000xp upgrades player to level 2
    let maxLevelXP2 = 10000 //10000xp upgrades player to level 3
    let maxLevelXP3 = 30000 //30000xp upgrades player to level 4
    let maxLevelXP4 = 60000 //60000xp upgrades player to level 5
    let maxLevelXP5 = 120000 //12000xp is max level of the game
    let XPArr = [Int](arrayLiteral: 5000, 10000, 30000, 60000, 120000) //Array holding each levels xp values to rank up
    
    var userName:String //Player's unique username that is displayed
    var totalXP:Int //Player's total Career XP
    var level:Int = 1 //Player's current level (based on xp)
    var currStreak:Int = 0 //Player's current win streak
    var gameScore:Int = 0 //Score in the current game
    
//---------------------------------------------------------------
    //initializes a Player object
    init?(userName: String, totalXP:Int, currStreak:Int) {
        if userName.isEmpty || totalXP < 0 || currStreak < 0 {
            return nil
        }
        self.userName = userName
        self.totalXP = totalXP
        self.currStreak = currStreak
        self.gameScore = 0
        //level = 1
        setLevel()
    }
    
//---------------------------------------------------------------
    // setLevel() sets the players level based on totalxp
    func setLevel(){
        /*
         The Levels will be determined by xp in this format:
         - Level 1: 0 - 4999xp
         - Level 2: 5000 - 9999xp
         - Level 3: 10000 - 29999xp
         - Level 4: 30000 - 59999xp
         - Level 5: 60000 - 120,000 (Master)
         */
        
        if totalXP < maxLevelXP1{
            level = 1
        }
        else if totalXP >= maxLevelXP1 && totalXP < maxLevelXP2{
            level = 2
        }
        else if totalXP >= maxLevelXP2 && totalXP < maxLevelXP3{
           level = 3
        }
        else if totalXP >= maxLevelXP3 && totalXP < maxLevelXP4{
            level = 4
        }
        else{
            level = 5
        }
    }
//---------------------------------------------------------------
    /*
     baseWinXP() adds a base XP when a player wins to the players totalXP.
     Amount of base xp is 10% the minimum total xp for the next level.
     */
    func baseWinXP(){ //called only if the player wins
        totalXP = totalXP + (XPArr[level-1] / 10)
    }
//---------------------------------------------------------------
    /*
     baseLossXP() subtracts a base XP from the player's totalXP after a loss
     Amount of base xp is 5% the total xp needed for the next level
     */
    func baseLossXP(){
        totalXP = totalXP - (XPArr[level-1] / 20)
    }
}
