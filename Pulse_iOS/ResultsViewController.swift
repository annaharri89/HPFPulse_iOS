//
//  ResultsViewController.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 9/2/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    var category: String!
    var selectedTimeZone: TimeZone!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new UIView and add it to the view controller
        
        // Do any additional setup after loading the view, typically from a nib.
        
        print(category)
        print(selectedTimeZone.getCode())
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
