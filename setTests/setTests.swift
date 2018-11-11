//
//  setTests.swift
//  setTests
//
//  Created by Anthony Mackay on 11/11/18.
//  Copyright © 2018 Anthony Mackay. All rights reserved.
//

import XCTest

class setTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_hasAMatch_noMatchIfNoCardsSelected() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cards: [Card] = []
        XCTAssertEqual(SetGame.hasAMatch(selectedCards: cards), false)
    }
    
    func test_hasAMatch_noMatchIfOneCardSelected() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cards: [Card] = [Card(attributes: [0, 0, 0, 0])]
        XCTAssertEqual(SetGame.hasAMatch(selectedCards: cards), false)
    }
    
    func test_hasAMatch_noMatchIfTwoCardsSelected() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cards: [Card] = [Card(attributes: [0, 0, 0, 0]), Card(attributes: [0, 0, 0, 0])]
        XCTAssertEqual(SetGame.hasAMatch(selectedCards: cards), false)
    }
    
    func test_hasAMatch_matchIfThreeIdenticalCardsSelected() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cards: [Card] = [
            Card(attributes: [0, 0, 0, 0]),
            Card(attributes: [0, 0, 0, 0]),
            Card(attributes: [0, 0, 0, 0])
        ]
        XCTAssertEqual(SetGame.hasAMatch(selectedCards: cards), true)
    }
    
    func test_hasAMatch_matchIfThreeCardsSelected() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cards: [Card] = [
            Card(attributes: [0, 0, 3, 2]),
            Card(attributes: [1, 0, 3, 0]),
            Card(attributes: [2, 0, 3, 1])
        ]
        XCTAssertEqual(SetGame.hasAMatch(selectedCards: cards), true)
    }
    
    func test_hasAMatch_noMatchIfThreeCardsSelected() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let cards: [Card] = [
            Card(attributes: [0, 0, 3, 2]),
            Card(attributes: [2, 0, 3, 0]),
            Card(attributes: [2, 0, 3, 1])
        ]
        XCTAssertEqual(SetGame.hasAMatch(selectedCards: cards), false)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
