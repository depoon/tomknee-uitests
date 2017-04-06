//
//  MagicEightUITests.swift
//  MagicEightUITests
//
//  Created by Thomas Knee on 04/04/2017.
//  Copyright © 2017 Thomas Knee. All rights reserved.
//

import XCTest
import XCTest_Gherkin

class MagicEightUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
        let window = XCUIApplication().windows["Window"]
        let btnOne = XCUIApplication().windows["Window"].buttons["Welcome"]
        XCTAssert(btnOne.exists)
        
        let helloWorld = window.staticTexts["HelloWorldLabel"]
        XCTAssertEqual(helloWorld.exists, true)
        
        let txtOne = window.textFields["Name"]
        XCTAssert(txtOne.exists)
        
        let myName = "Thomas"
        window.textFields["Name"].typeText(myName)
        btnOne.click()
        
        XCTAssert((helloWorld.value != nil), "Hello" + myName+"!")
        
        let ball1 = window.images["8ball"]
        XCTAssertEqual(ball1.isHittable, true)
    
        let advice1 = window.staticTexts["PieceOfAdviceLabel"]
        XCTAssertEqual(advice1.exists, false)
        
        ball1.click()
        let ball2 = window.images["magic8ball"]
        XCTAssertEqual(ball2.isHittable, true)
        XCTAssertEqual(ball1.exists, false)
        XCTAssertEqual(advice1.exists, true)
        
        let adviceList = [
            "Yes",
            "No",
            "Tom says 'do it!'",
            "Maybe",
            "Try again later",
            "How can I know?",
            "Totally",
            "Never",
            ]
        
        XCTAssert(adviceList.contains(advice1.value as! String))
        
        
        

        
        
        
    }
    
    
}
