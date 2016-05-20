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
    @IBOutlet weak var imgFood: DragImage!
    @IBOutlet weak var imgSkull1: UIImageView!
    @IBOutlet weak var imgSkull2: UIImageView!
    @IBOutlet weak var imgSkull3: UIImageView!
    @IBOutlet weak var lblRestart: UILabel!
    @IBOutlet weak var butRestart: UIButton!
    
    let DIM_ALPHA: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    let MAX_PENALITIES = 3
    
    var penalities = 0
    var timer: NSTimer!
    var monsterHappy = false
    var currentItem: UInt32 = 0
    
    var musicPlayer: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    var sfxDeath: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgFood.dropTarget = imgMonster
        imgHeart.dropTarget = imgMonster
        
        imgSkull1.alpha = DIM_ALPHA
        imgSkull2.alpha = DIM_ALPHA
        imgSkull3.alpha = DIM_ALPHA
        
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
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        startTimer()
    }
    
    func itemDroppedOnCharacter(notif: AnyObject) {
        monsterHappy = true
        startTimer()
        imgFood.alpha = DIM_ALPHA
        imgFood.userInteractionEnabled = false
        imgHeart.alpha = DIM_ALPHA
        imgHeart.userInteractionEnabled = false
        if currentItem == 0 {
            sfxHeart.play()
        } else if currentItem == 1 {
            sfxBite.play()
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
        let rand = arc4random_uniform(2)
        if rand == 0 {
            imgFood.alpha = DIM_ALPHA
            imgFood.userInteractionEnabled = false
            imgHeart.alpha = OPAQUE
            imgHeart.userInteractionEnabled = true
        } else {
            imgHeart.alpha = DIM_ALPHA
            imgHeart.userInteractionEnabled = false
            imgFood.alpha = OPAQUE
            imgFood.userInteractionEnabled = true
        }
        currentItem = rand
        monsterHappy = false
    }
    func gameOver() {
        timer.invalidate()
        imgMonster.playDeathAnimation()
        sfxDeath.play()
    }
    
}