//
//  BlitzSportsTriviaTests.swift
//  BlitzSportsTriviaTests
//
//  Created by Brendon Malouf on 2/17/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import XCTest
@testable import BlitzSportsTrivia

class BlitzSportsTriviaTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testPlayerInitSucceeds(){
        let player1 = Player.init(name: "Brendon", totalXP: 900, currStreak: 0)
        XCTAssertNotNil(player1)
        
        let player2 = Player.init(name: "Lily", totalXP: 4000, currStreak: 3)
        XCTAssertNotNil(player2)
    }
    
    func testPlayerInitFails(){
        let player1 = Player.init(name: "", totalXP: 900, currStreak: 0)
        XCTAssertNil(player1)
        let player2 = Player.init(name: "Bob", totalXP: -1000, currStreak: 0)
        XCTAssertNil(player2)
        let player3 = Player.init(name: "Lily", totalXP: 4000, currStreak: -1)
        XCTAssertNil(player3)
    }
    
    func testPlayerSetLevel(){
        let player1 = Player.init(name: "Brendon", totalXP: 0, currStreak: 0) //setLevel is called in init
        XCTAssertEqual(1, player1?.level)
        
        let player2 = Player.init(name: "Bob", totalXP: 4999, currStreak: 0) //setLevel is called in init
        XCTAssertEqual(1, player2?.level)
        
        let player3 = Player.init(name: "Marshall", totalXP: 50000, currStreak: 0) //setLevel is called in init
        XCTAssertEqual(4, player3?.level)
        
        let player4 = Player.init(name: "Marshall", totalXP: 100000, currStreak: 0) //setLevel is called in init
        XCTAssertEqual(5, player4?.level)
    }
    
    func testPlayerBaseWinXP(){
        let player1 = Player.init(name: "Bruce", totalXP: 50000, currStreak: 0)
        player1?.baseWinXP()
        XCTAssertEqual(56000, player1?.totalXP)//Since Bruce has 50000xp, he is in level 4. Therefore, his base win xp should add 6000 (10% of 60000) to his total xp.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
