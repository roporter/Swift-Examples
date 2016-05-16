//
//  ViewController.swift
//  SuperCool
//
//  Created by roporter on 15/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CoolLogo: UIImageView!
    @IBOutlet weak var CoolBG: UIImageView!
    @IBOutlet weak var UnCoolButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func makeMeSuperCool(sender: AnyObject) {
        CoolBG.hidden = false;
        CoolLogo.hidden = false;
        UnCoolButton.hidden = true;
    }

}

