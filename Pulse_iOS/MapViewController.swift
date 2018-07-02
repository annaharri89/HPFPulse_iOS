//
//  MapViewController.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 6/22/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class MapViewController: UIViewController {
    var category: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print (TimeZoneEnum.ALL.getName()) //todo remove
        print (StateEnum.ALASKA.getName())//todo remove
        
        // create a new UIView and add it to the view controller
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.view.addSubview(mapView)
        print("screen width")
        print(UIScreen.main.bounds.width)
        print("screen height")
        print(UIScreen.main.bounds.height)
        print("Hi" + category)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
