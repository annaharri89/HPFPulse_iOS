//
//  BlueButtonWhiteArrow.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 6/21/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class BlueButtonWhiteArrow: BlueButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentHorizontalAlignment = .left
        self.setImage(UIImage(named: "right_arrow"), for: .normal)
        
            self.imageView?.tintColor = UIColor.white
        
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 60), bottom: 5, right: 5)
            //titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
