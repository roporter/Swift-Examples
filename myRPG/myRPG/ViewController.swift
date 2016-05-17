//
//  ViewController.swift
//  myRPG
//
//  Created by roporter on 17/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblAction: UILabel!
    @IBOutlet weak var lblPlayerHP: UILabel!
    @IBOutlet weak var lblEnemyHP: UILabel!
    @IBOutlet weak var imgEnemy: UIImageView!
    @IBOutlet weak var butChest: UIButton!
    @IBOutlet weak var butAttack: UIButton!
    
    var player: Player!
    var enemy: Enemy!
    var droppedLoot: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player = Player(name: "Bison", hp: 110, attackPwr: 20)
        lblPlayerHP.text = "\(player.hp) HP"
        generateRandomEnemy()
        lblEnemyHP.text = "\(enemy.hp) HP"
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        if rand == 0 {
            enemy = Kimara(startingHP: 50, attackPwr: 12)
        } else {
            enemy = DevilWizard(startingHP: 60, attackPwr: 15)
        }
        imgEnemy.hidden = false
    }

    @IBAction func onChestPressed(sender: AnyObject) {
        butChest.hidden = true
        lblAction.text = droppedLoot
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
    }
    @IBAction func onAttackPressed(sender: AnyObject) {
        if enemy.attemptAttack(player.attackPower) {
            lblAction.text = "Attacked \(enemy.type) for \(player.attackPower) HP"
            lblEnemyHP.text = "\(enemy.hp) HP"
        } else {
            lblAction.text = "Attack was unsuccessful"
        }
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            droppedLoot = "\(player.name) found \(loot)"
            butChest.hidden = false
        }
        if !enemy.isAlive {
            lblEnemyHP.text = ""
            lblAction.text = "Killed \(enemy.type)"
            imgEnemy.hidden = true
        }
    }
}

