//
//  ViewController.swift
//  Exercise-myRPG
//
//  Created by roporter on 17/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblP2: UILabel!
    @IBOutlet weak var lblP1: UILabel!
    @IBOutlet weak var butP1Enemy: UIButton!
    @IBOutlet weak var butP1Knight: UIButton!
    @IBOutlet weak var butP2Enemy: UIButton!
    @IBOutlet weak var butP2Knight: UIButton!
    @IBOutlet weak var butStart: UIButton!
    @IBOutlet weak var imgP1Enemy: UIImageView!
    @IBOutlet weak var imgP1Knight: UIImageView!
    @IBOutlet weak var imgP2Enemy: UIImageView!
    @IBOutlet weak var imgP2Knight: UIImageView!
    @IBOutlet weak var btnP1Attack: UIButton!
    @IBOutlet weak var btnP2Attack: UIButton!
    @IBOutlet weak var lblAction: UIImageView!
    //@IBOutlet weak var lblStart: UILabel!
    
    enum eCharacter: String {
        case Enemy = "Enemy"
        case Knight = "Knight"
        case Empty = ""
    }
    
    var Player1Character = eCharacter.Empty
    var Player2Character = eCharacter.Empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onP1EnemyPressed(sender: AnyObject) {
        butP1Knight.hidden = true
        Player1Character = eCharacter.Enemy
    }
    @IBAction func onP1KnightPressed(sender: AnyObject) {
        butP1Enemy.hidden = true
        Player1Character = eCharacter.Knight
    }
    @IBAction func onP2EnemyPressed(sender: AnyObject) {
        butP2Knight.hidden = true
        Player2Character = eCharacter.Enemy
    }
    @IBAction func onP2KnightPressed(sender: AnyObject) {
        butP2Enemy.hidden = true
        Player2Character = eCharacter.Knight
    }
    @IBAction func onStartPressed(sender: AnyObject) {
        if Player1Character != eCharacter.Empty && Player2Character != eCharacter.Empty {
            startGame()
        }
    }
    
    func startGame() {
        lblP1.hidden = true
        lblP2.hidden = true
        butP1Enemy.hidden = true
        butP1Knight.hidden = true
        butP2Enemy.hidden = true
        butP2Knight.hidden = true
        butStart.hidden = true
        //lblStart.hidden = true
        if Player1Character == eCharacter.Enemy { imgP1Enemy.hidden = false } else if Player1Character == eCharacter.Knight { imgP1Knight.hidden = false }
        if Player2Character == eCharacter.Enemy { imgP2Enemy.hidden = false } else if Player2Character == eCharacter.Knight { imgP2Knight.hidden = false }
        lblAction.hidden = false
        btnP1Attack.hidden = false
        btnP2Attack.hidden = false
    }
    func restartGame() {
        lblP1.hidden = false
        lblP2.hidden = false
        butP1Enemy.hidden = false
        butP1Knight.hidden = false
        butP2Enemy.hidden = false
        butP2Knight.hidden = false
        butStart.hidden = false
        //lblStart.hidden = false
        imgP1Enemy.hidden = true
        imgP1Knight.hidden = true
        imgP2Enemy.hidden = true
        imgP2Knight.hidden = true
        lblAction.hidden = true
        btnP1Attack.hidden = true
        btnP2Attack.hidden = true
    }
}

