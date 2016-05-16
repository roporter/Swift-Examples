//
//  ViewController.swift
//  myBombApp
//
//  Created by roporter on 15/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BlueBombImage: UIImageView!
    @IBOutlet weak var RedBombImage: UIImageView!
    @IBOutlet weak var BlueBombButton: UIButton!
    @IBOutlet weak var RedBombButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func HideBlueBomb(sender: AnyObject) {
        BlueBombImage.hidden=true;
    }
    @IBAction func HideRedBomb(sender: AnyObject) {
        RedBombImage.hidden=true;
    }

}

