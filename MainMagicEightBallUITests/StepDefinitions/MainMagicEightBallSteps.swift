//
//  MainMagicEightBallSteps.swift
//  MainMagicEightBall
//
//  Created by Thomas Knee on 06/04/2017.
//  Copyright © 2017 Thomas Knee. All rights reserved.
//

import XCTest
import XCTest_Gherkin

class MainMagicEightBallSteps: StepDefiner {
    override func defineSteps() {
        step("I see the default 'Hello World' label") {
            //create variable for main window view
            let window = XCUIApplication().windows["Window"]
            
            //create a variable for the "Hello World" label
            let helloWorld = window.staticTexts["HelloWorldLabel"]
            
            //assert that the "Hello World" label is visible
            XCTAssertEqual(helloWorld.exists, true)
        }
        step("I enter my name into the textbox") {
            //create variable for main window view
            let window = XCUIApplication().windows["Window"]
            
            //create a variable for the text input field
            let txtOne = window.textFields["Name"]
            
            //assert that the text field is visible
            XCTAssert(txtOne.exists)
            
            //create a variable with the string value of "Thomas"
            let myName = "Thomas"
            
            //input the string stored in the myName variable into the text field.
            window.textFields["Name"].typeText(myName)
        }
        step("I click the 'Welcome' button") {
            //create variable for main window view
            let window = XCUIApplication().windows["Window"]
            
            //create variable for the "Welcome" button
            let btnOne = window.buttons["Welcome"]
            
            //assert that the "Welcome" button is visible
            XCTAssert(btnOne.exists)
            
            //click the "Welcome" button
            btnOne.click()
        }
        step("the label updates to personally greet me") {
            //create variable for main window view
            let window = XCUIApplication().windows["Window"]
            
            //create a variable with the string value of "Thomas"
            let myName = "Thomas"
            
            //create a variable for the "Hello World" label
            let helloWorld = window.staticTexts["HelloWorldLabel"]
            
            //assert greeting is correct
            XCTAssert(helloWorld.value != nil, "Hello" + myName+"!")
        }
    }

}
