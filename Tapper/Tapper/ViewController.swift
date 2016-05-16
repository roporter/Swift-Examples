//
//  ViewController.swift
//  Tapper
//
//  Created by roporter on 15/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Properties
    var intMaxTaps: Int = 0
    var intCurTaps: Int = 0
    
    // Outlets
    @IBOutlet weak var imgTapperLogo: UIImageView!
    @IBOutlet weak var txtTapCount: UITextField!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnTap: UIButton!
    @IBOutlet weak var lblTapCount: UILabel!
    
    // Actions
    @IBAction func onPlayButtonPressed(sender:  UIButton!) {
        if txtTapCount.text != nil && txtTapCount.text != "" {
            intMaxTaps = Int(txtTapCount.text!)!;
            intCurTaps = 0;
            imgTapperLogo.hidden = true;
            txtTapCount.hidden = true;
            btnPlay.hidden = true;
            btnTap.hidden = false;
            lblTapCount.hidden = false;
            updateTapsLabel();
        }
    }
    @IBAction func onTapButtonPressed(sender: UIButton!) {
        intCurTaps += 1;
        updateTapsLabel();
        if isGameOver() {
            restartGame();
        }
    }
    
    // Generic functions
    func updateTapsLabel() {
        lblTapCount.text = "\(intCurTaps) Taps";
    }
    func isGameOver() -> Bool {
        if intCurTaps >= intMaxTaps {
            return true;
        } else {
            return false;
        }
    }
    func restartGame() {
        intMaxTaps = 0;
        txtTapCount.text = "";
        imgTapperLogo.hidden = false;
        txtTapCount.hidden = false;
        btnPlay.hidden = false;
        btnTap.hidden = true;
        lblTapCount.hidden = true;

    }
}

