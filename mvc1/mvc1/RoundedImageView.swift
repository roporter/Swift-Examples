//
//  RoundedImageView.swift
//  mvc1
//
//  Created by roporter on 19/05/2016.
//  Copyright © 2016 roporter. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    override func awakeFromNib() {
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
