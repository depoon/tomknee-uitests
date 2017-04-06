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
        step("I click the Welcome button") {
            let btnOne = XCUIApplication().windows["Window"].buttons["Welcome"]
            btnOne.click()
        }
    }
}
