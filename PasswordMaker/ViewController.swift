//
//  ViewController.swift
//  PasswordMaker
//
//  Created by Elliot Maisl on 27/11/2020.
//

import Cocoa

let alphabet = "abcdefghijklmnopqrstuvwxyz"
let characterPool = [
    "lowercase": alphabet,
    "uppercase": alphabet.uppercased(),
    "numbers": "1234567890",
    "symbols": "@#&()[]{}§!?,.;/:+=%*$€<>",
]

class ViewController: NSViewController {
    @IBOutlet weak var lengthSlider: NSSlider!
    @IBOutlet weak var containsUppercaseCheckbox: NSButton!
    @IBOutlet weak var containsNumbersCheckbox: NSButton!
    @IBOutlet weak var containsSymbolsCheckbox: NSButton!
    @IBOutlet weak var outputPassword: NSTextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func exitApplication(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }

    @IBAction func copyToClipboard(_ sender: Any) {
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(outputPassword.stringValue, forType: .string)
    }

    @IBAction func generatePassword(_ sender: Any) {
        var pool: String = characterPool["lowercase"]!

        if containsUppercaseCheckbox.state == .on {
            pool.append(characterPool["uppercase"]!)
        }
        if containsNumbersCheckbox.state == .on {
            pool.append(characterPool["numbers"]!)
        }
        if containsSymbolsCheckbox.state == .on {
            pool.append(characterPool["symbols"]!)
        }

        var password = ""
        for _ in 0...lengthSlider.intValue {
            password.append(pool.randomElement() ?? "-")
        }

        outputPassword.stringValue = password
    }


}

