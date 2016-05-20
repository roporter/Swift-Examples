//
//  ViewController.swift
//  myLittleMonster
//
//  Created by roporter on 18/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var imgMonster: ImgMonster!
    @IBOutlet weak var imgHeart: DragImage!
    @IBOutlet weak var imgProtect: DragImage!
    @IBOutlet weak var imgFood: DragImage!
    @IBOutlet weak var imgSkull1: UIImageView!
    @IBOutlet weak var imgSkull2: UIImageView!
    @IBOutlet weak var imgSkull3: UIImageView!
    @IBOutlet weak var butRestart: UIButton!
    @IBOutlet weak var imgMonsterLeadSpace: NSLayoutConstraint!
    @IBOutlet weak var imgMonsterBottomSpace: NSLayoutConstraint!
    @IBOutlet weak var svCharacters: UIStackView!
    @IBOutlet weak var imgLivesPanel: UIImageView!
    @IBOutlet weak var butCharacter1: UIButton!
    @IBOutlet weak var butCharacter2: UIButton!
    @IBOutlet weak var butCharacter3: UIButton!
    @IBOutlet weak var butCharacter4: UIButton!
    @IBOutlet weak var butCharacter5: UIButton!
    @IBOutlet weak var butCharacter6: UIButton!
    @IBOutlet weak var butRandom: UIButton!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALITIES = 3
    
    var penalities = 0
    var timer: NSTimer!
    var monsterHappy = false
    var currentItem: UInt32 = 0
    var monsterCharacter = 0
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgFood.dropTarget = imgMonster
        imgProtect.dropTarget = imgMonster
        imgHeart.dropTarget = imgMonster
        butRestart.hidden = true
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.itemDroppedOnCharacter(_:)), name: "onTargetDropped", object: nil)
        
        do {
            let resourcePath = NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!
            let url = NSURL(fileURLWithPath: resourcePath)
            try musicPlayer = AVAudioPlayer(contentsOfURL: url)
            
            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            try sfxDeath = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
            
            musicPlayer.prepareToPlay()
            musicPlayer.play()
            
            sfxBite.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxDeath.prepareToPlay()
            sfxSkull.prepareToPlay()
            
            displayCharacterSelection()
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    func setCharacter(number: Int) {
        imgMonster.setCharacter(number)
        imgMonsterLeadSpace.constant = imgMonster.leftMargin
        imgMonsterBottomSpace.constant = imgMonster.bottomMargin
    }
    func displayCharacterSelection() {
        svCharacters.hidden = false
        imgMonster.hidden = true
        imgSkull1.hidden = true
        imgSkull2.hidden = true
        imgSkull3.hidden = true
        imgHeart.hidden = true
        imgProtect.hidden = true
        imgFood.hidden = true
        imgLivesPanel.hidden = true
    }
    func hideCharacterSelection() {
        svCharacters.hidden = true
        imgMonster.hidden = false
        imgSkull1.hidden = false
        imgSkull2.hidden = false
        imgSkull3.hidden = false
        imgHeart.hidden = false
        imgProtect.hidden = false
        imgFood.hidden = false
        imgLivesPanel.hidden = false
    }
    func startGame() {
        imgSkull1.alpha = DIM_ALPHA
        imgSkull2.alpha = DIM_ALPHA
        imgSkull3.alpha = DIM_ALPHA
        
        penalities = 0
        monsterHappy = false
        currentItem = 0
        
        butRestart.hidden = true
        imgMonster.playIdleAnimation()
        
        startTimer()
    }
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        startTimer()
        imgFood.alpha = DIM_ALPHA
        imgFood.userInteractionEnabled = false
        imgHeart.alpha = DIM_ALPHA
        imgHeart.userInteractionEnabled = false
        imgProtect.alpha = DIM_ALPHA
        imgProtect.userInteractionEnabled = false
        
        if currentItem == 0 {
            sfxHeart.play()
        } else if currentItem == 1 {
            sfxBite.play()
        } else if currentItem == 2 {
            
        }
    }
    func startTimer() {
        if timer != nil {
            timer.invalidate()
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: #selector(ViewController.changeGameState), userInfo: nil, repeats: true)
    }
    func changeGameState() {
        if !monsterHappy {
            penalities += 1
            sfxSkull.play()
            if penalities == 1 {
                imgSkull1.alpha = OPAQUE
                imgSkull2.alpha = DIM_ALPHA
            } else if penalities == 2 {
                imgSkull2.alpha = OPAQUE
                imgSkull3.alpha = DIM_ALPHA
            } else if penalities >= 3 {
                imgSkull3.alpha = OPAQUE
            } else {
                imgSkull1.alpha = DIM_ALPHA
                imgSkull2.alpha = DIM_ALPHA
                imgSkull3.alpha = DIM_ALPHA
            }
            if penalities >= MAX_PENALITIES {
                gameOver()
            }
        }
        let rand = arc4random_uniform(3)
        if rand == 0 {
            imgHeart.alpha = OPAQUE
            imgHeart.userInteractionEnabled = true
            imgFood.alpha = DIM_ALPHA
            imgFood.userInteractionEnabled = false
            imgProtect.alpha = DIM_ALPHA
            imgProtect.userInteractionEnabled = false
        } else if rand == 1 {
            imgHeart.alpha = DIM_ALPHA
            imgHeart.userInteractionEnabled = false
            imgFood.alpha = OPAQUE
            imgFood.userInteractionEnabled = true
            imgProtect.alpha = DIM_ALPHA
            imgProtect.userInteractionEnabled = false
        } else if rand == 2 {
            imgHeart.alpha = DIM_ALPHA
            imgHeart.userInteractionEnabled = false
            imgFood.alpha = DIM_ALPHA
            imgFood.userInteractionEnabled = false
            imgProtect.alpha = OPAQUE
            imgProtect.userInteractionEnabled = true
        }
        currentItem = rand
        monsterHappy = false
    }
    func gameOver() {
        timer.invalidate()
        imgMonster.playDeathAnimation()
        sfxDeath.play()
        butRestart.hidden = false
    }
    @IBAction func onRandomPressed(sender: AnyObject) {
        let rand = arc4random_uniform(5)
        setCharacter(Int(rand))
        hideCharacterSelection()
        startGame()
    }
    @IBAction func onCharacter1Pressed(sender: AnyObject) {
        setCharacter(0)
        hideCharacterSelection()
        startGame()
    }
    @IBAction func onCharacter2Pressed(sender: AnyObject) {
        setCharacter(1)
        hideCharacterSelection()
        startGame()
    }
    @IBAction func onCharacter3Pressed(sender: AnyObject) {
        setCharacter(2)
        hideCharacterSelection()
        startGame()
    }
    @IBAction func onCharacter4Pressed(sender: AnyObject) {
        setCharacter(3)
        hideCharacterSelection()
        startGame()
    }
    @IBAction func onCharacter5Pressed(sender: AnyObject) {
        setCharacter(4)
        hideCharacterSelection()
        startGame()
    }
    @IBAction func onCharacter6Pressed(sender: AnyObject) {
        setCharacter(5)
        hideCharacterSelection()
        startGame()
    }
    @IBAction func onRestartPressed(sender: AnyObject) {
        startGame()
    }
}

