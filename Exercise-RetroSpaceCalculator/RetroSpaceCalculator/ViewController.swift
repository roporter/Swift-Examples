//
//  ViewController.swift
//  RetroSpaceCalculator
//
//  Created by roporter on 16/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Addition = "+"
        case Empty = "Empty"
    }
    
    var btnSound: AVAudioPlayer!
    var runningNumber: String = ""
    var leftValueString: String = ""
    var rightValueString: String = ""
    var currentOperation = Operation.Empty
    var result = ""
    
    @IBOutlet weak var lblOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblOutput.text = "0"
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        do {
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    @IBAction func numberPressed(sender: UIButton!) {
        playSound()
        runningNumber += "\(sender.tag)"
        lblOutput.text = runningNumber
    }
    @IBAction func onDividePressed(sender: UIButton!) {
        processOperation(Operation.Divide)
    }
    @IBAction func onMultiplyPressed(sender: UIButton!) {
        processOperation(Operation.Multiply)
    }
    @IBAction func onSubtractPressed(sender: UIButton!) {
        processOperation(Operation.Subtract)
    }
    @IBAction func onAdditionPressed(sender: UIButton!) {
        processOperation(Operation.Addition)
    }
    @IBAction func onEqualPressed(sender: UIButton!) {
        processOperation(currentOperation)
    }
    @IBAction func onClearPressed(sender: UIButton) {
        playSound()
        runningNumber = ""
        leftValueString = ""
        rightValueString = ""
        lblOutput.text = "0"
        currentOperation = Operation.Empty
    }
    
    func playSound() {
        if btnSound.playing {
            btnSound.stop()
        }
        btnSound.play()
    }
    func processOperation(op: Operation) {
        playSound()
        if currentOperation != Operation.Empty {
            if runningNumber != "" {
                rightValueString = runningNumber
                runningNumber = ""
                if currentOperation == Operation.Multiply {
                    result = "\(Double(leftValueString)! * Double(rightValueString)!)"
                } else if currentOperation == Operation.Addition {
                    result = "\(Double(leftValueString)! + Double(rightValueString)!)"
                } else if currentOperation == Operation.Divide {
                    result = "\(Double(leftValueString)! / Double(rightValueString)!)"
                } else if currentOperation == Operation.Subtract {
                    result = "\(Double(leftValueString)! - Double(rightValueString)!)"
                }
                
                leftValueString = result
                lblOutput.text = result
            }
            currentOperation = op
        } else {
            leftValueString = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
}

