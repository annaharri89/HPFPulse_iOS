//
//  BlueButton.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 6/21/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class BlueButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.buttonBlue()
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.cornerRadius = 5
    }
}
