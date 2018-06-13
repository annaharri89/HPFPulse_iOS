//
//  Colors.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 5/31/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func getMapColor(qualifier: String) -> UIColor {
        switch qualifier {
        case "1":
            return Utils.UIColorFromRGB(rgbValue: 0x18768e)
        case "2":
            return Utils.UIColorFromRGB(rgbValue: 0x00A9D4)
        case "3":
            return Utils.UIColorFromRGB(rgbValue: 0x3999b2)
        case "4":
            return Utils.UIColorFromRGB(rgbValue: 0x6ec6dd)
        case "5":
            return Utils.UIColorFromRGB(rgbValue: 0xbbdfe8)
        case "highlight":
            return Utils.UIColorFromRGB(rgbValue: 0xfab31b)
        default:
            return Utils.UIColorFromRGB(rgbValue: 0x18768e)
        }
    }
    
    static func buttonBlue() {
        //todo return color
    }
}