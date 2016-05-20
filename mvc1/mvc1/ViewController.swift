//
//  ViewController.swift
//  mvc1
//
//  Created by roporter on 19/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var tfNewName: UITextField!
    @IBOutlet weak var butRenameUSer: UIButton!
    
    let person = Person(first: "Rob", last: "Porter")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = person.fullName
    }
    @IBAction func onChangeNamePressed(sender: AnyObject) {
        if let txt = tfNewName.text {
            person.firstName = txt
            lblName.text = person.fullName
        }
    }
}

