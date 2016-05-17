//
//  kimara.swift
//  myRPG
//
//  Created by roporter on 17/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import Foundation

class Kimara: Enemy {
    let IMMUNE_MAX = 15
    
    override var loot: [String] {
        return ["Tough hide", "Kimara venom", "Rare trident"]
    }
    override var type: String {
        return "Kimara"
    }
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
}