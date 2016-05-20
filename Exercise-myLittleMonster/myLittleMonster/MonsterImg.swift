//
//  MonsterImg.swift
//  myLittleMonster
//
//  Created by roporter on 18/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import Foundation
import UIKit

class ImgMonster: UIImageView {
    private var bMargin: CGFloat = 0
    private var lMargin: CGFloat = 0
    private var character: Int = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        playIdleAnimation()
    }
    var leftMargin: CGFloat {
        return self.lMargin
    }
    var bottomMargin: CGFloat {
        return self.bMargin
    }
    func setCharacter(number: Int) {
        self.character = number
        self.setSize()
    }
    private func setSize() {
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        switch self.character {
        case 0:                                     // Stone Giant
            width = 449
            height = 512
            lMargin = -20
            bMargin = -40
        case 1:                                     // Small Stone Giant
            width = 420
            height = 240
            lMargin = -60
            bMargin = 70
        case 2:                                     // Mole
            width = 420
            height = 240
            lMargin = -60
            bMargin = 74
        case 3:                                     // Blue Snail
            width = 420
            height = 240
            lMargin = -60
            bMargin = 66
        case 4:                                     // Pink Snail
            width = 420
            height = 240
            lMargin = -60
            bMargin = 66
        case 5:                                     // Miner
            width = 420
            height = 240
            lMargin = -60
            bMargin = 66
        default:                                    // Not sure
            self.frame = CGRectMake(0,0,200,200)
        }
        
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: (width)))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: (height)))
    }
    func playIdleAnimation() {
        var imgArray = [UIImage]()
        self.image = UIImage(named: "idle\(self.character)_1.png")
        self.animationImages = nil
        for x in 1...4 {
            let img = UIImage(named: "idle\(self.character)_\(x).png")
            imgArray.append(img!)
        }
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    func playDeathAnimation() {
        var imgArray = [UIImage]()
        self.image = UIImage(named: "dead\(self.character)_5.png")
        self.animationImages = nil
        for x in 1...5 {
            let img = UIImage(named: "dead\(self.character)_\(x).png")
            imgArray.append(img!)
        }
        self.animationImages = imgArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 1
        self.startAnimating()
    }
}