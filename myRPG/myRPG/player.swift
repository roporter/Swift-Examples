//
//  player.swift
//  myRPG
//
//  Created by roporter on 17/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import Foundation

class Player: Character {
    private var _name = "Player"
    private var _inventory = [String]()
    
    var name: String {
        get {
            return _name
        }
    }
    var inventory: [String] {
        return _inventory
    }
    
    func addItemToInventory(item: String) {
        _inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(startingHP: hp, attackPwr: attackPwr)
        _name = name
    }
    
    
}