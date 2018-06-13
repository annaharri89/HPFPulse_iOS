//
//  FirstViewController.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 5/17/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    var mapView: MapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        print (TimeZoneEnum.ALL.getName()) //todo remove
        print (StateEnum.ALASKA.getName())//todo remove
        
        // create a new UIView and add it to the view controller
        
        // Do any additional setup after loading the view, typically from a nib.
        
        mapView = MapView(frame: CGRect.zero)
        //self.view.addSubview(mapView)
        print("screen width")
        print(UIScreen.main.bounds.width)
        print("screen height")
        print(UIScreen.main.bounds.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

