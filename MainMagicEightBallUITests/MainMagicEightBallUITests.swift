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
        
        //create variable for main window view
        let window = XCUIApplication().windows["Window"]
        
        //create variable for the "Welcome" button
        let btnOne = XCUIApplication().windows["Window"].buttons["Welcome"]
        
        //assert that the "Welcome" button is visible
        XCTAssert(btnOne.exists)
        
        //create a variable for the "Hello World" label
        let helloWorld = window.staticTexts["HelloWorldLabel"]
        
        //assert that the "Hello World" label is visible
        XCTAssertEqual(helloWorld.exists, true)
        
        //create a variable for the text input field
        let txtOne = window.textFields["Name"]
        
        //assert that the text field is visible
        XCTAssert(txtOne.exists)
        
        //create a variable with the string value of "Thomas"
        let myName = "Thomas"
        
        //input the string stored in the myName variable into the text field.
        window.textFields["Name"].typeText(myName)
        
        //click the "Welcome" button
        btnOne.click()
        
        //assert that the "Hello World" label updates to read "Hello [myName]!"
        XCTAssert((helloWorld.value != nil), "Hello" + myName+"!")
        
        //create a variable for the 8 ball image before it has been clicked on to show any magic advice
        let ball1 = window.images["8ball"]
        
        //assert that the 8ball image that does not show advice is currently visible
        XCTAssertEqual(ball1.isHittable, true)
        
        //create a variable for the magic8ball image that shows advice
        let ball2 = window.images["magic8ball"]
        
        //assert that the magic8ball image is not currently visible when normal 8ball image is
        XCTAssertEqual(ball2.exists, false)
        
        //create variable for the "Piece of Advice" label
        let advice1 = window.staticTexts["PieceOfAdviceLabel"]
        
        //assert that the "Piece of Advice" label is not currently visible
        XCTAssertEqual(advice1.exists, false)
        
        //click the 8ball to show the magic8ball image instead with advice
        ball1.click()
        
        //assert that magic8ball image is now visible
        XCTAssertEqual(ball2.isHittable, true)
        
        //assert that normal 8ball image is no longer visible
        XCTAssertEqual(ball1.exists, false)
        
        //assert that the "Piece of Advice" label is now also visble
        XCTAssertEqual(advice1.exists, true)
        
        //create an array of string the "Piece of Advice" label can return
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
        
        //assert that the "Piece of Advice" label displays one of the strings listed in the array.
        XCTAssert(adviceList.contains(advice1.value as! String))
        
        
        

        
        
        
    }
    
    
}
