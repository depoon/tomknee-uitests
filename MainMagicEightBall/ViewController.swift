//
//  ViewController.swift
//  MainMagicEightBall
//
//  Created by Thomas Knee on 05/04/2017.
//  Copyright © 2017 Thomas Knee. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
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

    @IBOutlet weak var nameTextField: NSTextField!
    @IBOutlet weak var welcomeLabel: NSTextField!
    @IBAction func handleWelcome(_ sender: AnyObject) {
        welcomeLabel.stringValue = "Hello \(nameTextField.stringValue)!"
    }
    
    @IBOutlet weak var ballImageView: NSImageView!
    @IBOutlet weak var adviceLabel: NSTextField!
    @IBAction func handleBallClick(_ sender: AnyObject) {
        // 1:
        if let advice = adviceList.randomElement {
            adviceLabel.stringValue = advice
            adviceLabel.isHidden = false
            ballImageView.image = NSImage(named: "magic8ball")
        } else {
            // 3:
            adviceLabel.isHidden = true
            ballImageView.image = NSImage(named: "8ball")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        adviceLabel.isHidden = true
        ballImageView.image = NSImage(named: "8ball")
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension Array {
    var randomElement: Element? {
        if count < 1 { return .none }
        let randomIndex = arc4random_uniform(UInt32(count))
        return self[Int(randomIndex)]
    }
}
