//
//  ViewController.swift
//  Adder
//
//  Created by roporter on 15/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Properties
    var intMaxCount: Int = 10;
    var intCurrentCount: Int = 0;
    var intMultiple: Int = 0;
    
    // Outlets
    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var txtAddInput: UITextField!
    
    @IBOutlet weak var lblCurrentMath: UILabel!
    @IBOutlet weak var btnAdd: UIButton!
    
    // Actions
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        intCurrentCount = 0
        if txtAddInput.text != nil && txtAddInput.text != "" {
            hideNewGameElements()
            showGameElements()
            intMultiple = Int(txtAddInput.text!)!
            lblCurrentMath.text = "0 + \(intMultiple) = \(intMultiple)"
        }
    }
    @IBAction func onAddButtonPressed(sender: UIButton!) {
        intCurrentCount += 1;
        if intCurrentCount >= intMaxCount {
            hideGameElements()
            showNewGameElements()
            txtAddInput.text = ""
        }
        let sum: Int = intCurrentCount + intMultiple
        lblCurrentMath.text = "\(intCurrentCount) + \(intMultiple) = \(sum)"
    }
    
    // Custom Functions
    func hideNewGameElements() {
        imgLogo.hidden = true
        btnPlay.hidden = true
        txtAddInput.hidden = true
    }
    func showNewGameElements() {
        imgLogo.hidden = false
        btnPlay.hidden = false
        txtAddInput.hidden = false
    }
    func hideGameElements() {
        lblCurrentMath.hidden = true
        btnAdd.hidden = true
    }
    func showGameElements() {
        lblCurrentMath.hidden = false
        btnAdd.hidden = false
    }
}

