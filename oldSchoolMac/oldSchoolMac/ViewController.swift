//
//  ViewController.swift
//  oldSchoolMac
//
//  Created by roporter on 16/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var phrases = ["Booting from floppy....\n", "Reading from disk....\n", "Updating registry....\n","........\n", "................\n", "........................\n", "Welcome, Operating System loaded and ready to be used.\n"]
    
    @IBOutlet weak var lblMainText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        for x in 0 ..< phrases.count {
//            var tmp = lblMainText.text!
//            tmp += phrases[x]
//            lblMainText.text = tmp
//        }
        
//        var x = 0
//        repeat {
//            var tmp = lblMainText.text!
//            tmp += phrases[x]
//            lblMainText.text = tmp
//            x += 1
//        } while x < phrases.count
        
        for phrase in phrases {
            var tmp = lblMainText.text!
            tmp += phrase
            lblMainText.text = tmp
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

