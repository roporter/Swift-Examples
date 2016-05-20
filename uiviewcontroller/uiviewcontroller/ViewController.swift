//
//  ViewController.swift
//  uiviewcontroller
//
//  Created by roporter on 20/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        // Called once
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGrayColor()
    }
    override func viewWillAppear(animated: Bool) {
        // Called everytime page is shown
        super.viewWillAppear(animated)
    }
    override func viewDidLayoutSubviews() {
        // Can be used to ensure layout is done correctly
        super.viewDidLayoutSubviews()
    }
}

