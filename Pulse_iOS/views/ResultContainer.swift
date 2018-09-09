//
//  ResultContainer.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 9/9/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class ResultContainer: UIStackView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.addLeftBorder(borderWidth: 2)
        self.addRightBorder(borderWidth: 2)
        self.addTopBorder(borderWidth: 1)
        self.addBottomBorder(borderWidth: 2)
        
    }

    func addRightBorder(borderWidth: CGFloat) {
    let border = CALayer()
    border.backgroundColor = UIColor.lightGrey().cgColor
    border.frame = CGRect(x: self.frame.size.width - borderWidth, y: 0, width:borderWidth, height:self.frame.size.height)
    self.layer.addSublayer(border)
    }
    
    func addLeftBorder(borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = UIColor.lightGrey().cgColor
        border.frame = CGRect(x:0, y:0, width:borderWidth, height:self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorder(borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = UIColor.lightGray.cgColor
        border.frame = CGRect(x:0, y:self.frame.size.height, width:self.frame.size.width, height:borderWidth)
        self.layer.addSublayer(border)
    }
    
    func addTopBorder(borderWidth: CGFloat) {
        let border = CALayer()
        border.backgroundColor = UIColor.lightGrey().cgColor
        border.frame = CGRect(x:0, y:0, width:self.frame.size.width, height:borderWidth)
        self.layer.addSublayer(border)
    }
    
}
