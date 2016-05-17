//
//  enemy.swift
//  myRPG
//
//  Created by roporter on 17/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import Foundation

class Enemy: Character {
    var loot: [String] {
        return ["Rusty dagger", "Cracked Buckler"]
    }
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let r = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[r]
        }
        return nil
    }
}