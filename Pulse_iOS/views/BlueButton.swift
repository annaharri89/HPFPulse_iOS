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
        self.layer.cornerRadius = 5
        
        //enabled
        if (self.state == .normal) {
            self.backgroundColor = UIColor.buttonBlue()
        }
        self.setTitleColor(UIColor.white, for: .normal)
        
        //disabled
        if (self.state == .disabled) {
            self.backgroundColor = UIColor.gray
        }
    }
}
