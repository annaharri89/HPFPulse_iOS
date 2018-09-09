//
//  ResultButton.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 9/9/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class ResultButton: UIButton {
    @IBInspectable var isRight: Bool
    
    init(isRight: Bool) {
        self.isRight = isRight
        super.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        self.isRight = false
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.isRight = false
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.backgroundColor = UIColor.veryLightGrey()
        self.setTitleColor(UIColor.darkOrange(), for: .normal)
        
        if (!isRight) {
            self.addRightBorder(borderWidth: 1)
        } else {
            self.addLeftBorder(borderWidth: 1)
            
        }
    }
    
    func addRightBorder(borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x: self.frame.size.width - borderWidth, y: 0, width:borderWidth, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addLeftBorder(borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x:0, y:0, width:borderWidth, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
}
