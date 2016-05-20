//
//  Character.swift
//  Exercise-myRPG
//
//  Created by roporter on 17/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

enum eCharacter: String {
    case Enemy = "Enemy"
    case Knight = "Knight"
    case Empty = ""
}

import Foundation

class Character {
    private var _image: eCharacter?
    private var _hp = 100
    private var _name = "empty"
    private var _attackPwr = 10
    
    var image: eCharacter {
        if _image == nil {
            return eCharacter.Empty
        } else {
            return self._image!
        }
    }
    var hp: Int {
        get {
            return self._hp
        }
        set {
            self._hp = newValue
        }
    }
    var name: String {
        get {
            return self._name
        }
        set {
            self._name = newValue
        }
    }
    var attackPwr: Int {
        get {
            return self._attackPwr
        }
        set {
            self._attackPwr = newValue
        }
    }
    
    init() {
        
    }
    
    func setImage(image: eCharacter) {
        self._image = image
    }
}