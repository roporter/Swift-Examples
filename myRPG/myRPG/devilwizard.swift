//
//  devilwizard.swift
//  myRPG
//
//  Created by roporter on 17/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import Foundation

class DevilWizard: Enemy {
    override var loot: [String] {
        return ["Magic wand","Dark amulet", "Slated pork"]
    }
    override var type: String {
        return "Devil Wizard"
    }
}