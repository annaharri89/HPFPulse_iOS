//
//  MapViewController.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 6/22/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

protocol MapDelegate: class {
    func onTimeZoneSelected(sender: UIView)
    func onResultsLoaded(sender: UIView)
}

class MapViewController: UIViewController, MapDelegate {
    var category: String!
    var selectedTimeZone: TimeZone?
    @IBOutlet weak var mapView: MapView!
    @IBOutlet weak var getResults: BlueButtonWhiteArrow!
    @IBOutlet weak var descriptionText: UILabel!
    var spinner: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinner = UIViewController.displaySpinner(onView: self.view)

        // create a new UIView and add it to the view controller
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //disable getResults
        getResults.isEnabled = false
        getResults.alpha = 0.5
        
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func enableGetResults() {
        getResults.isEnabled = true
        getResults.alpha = 1
    
    }
    
    func setDescription() {
        let c = self.category
        let t = self.selectedTimeZone?.getEnum().getDescription()
        var description: String
        if (c == Config.categories.ALL_RESOURCES) {
            description = "This includes all resources for \(String(describing: t!))"
        } else {
            description = "This includes \(String(describing: c!.lowercased())) resources for \(String(describing: t!))"
        }
        
        self.descriptionText.text = description
    }
    
    func onTimeZoneSelected(sender: UIView) {
        if (!getResults.isEnabled) {
            enableGetResults()
        }
        selectedTimeZone = mapView.getSelectedTimeZone()
        setDescription()
    }
    
    func onResultsLoaded(sender: UIView) {
        UIViewController.removeSpinner(spinner: self.spinner)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! CategoryResultsViewController
        vc.category = self.category
        vc.selectedTimeZone = self.selectedTimeZone
    }
    
    
}
extension UIViewController {
    class func displaySpinner(onView : UIView) -> UIView {
        let spinnerView = UIView.init(frame: onView.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        ai.startAnimating()
        ai.center = spinnerView.center
        
        DispatchQueue.main.async {
            spinnerView.addSubview(ai)
            onView.addSubview(spinnerView)
        }
        
        return spinnerView
    }
    
    class func removeSpinner(spinner :UIView) {
        DispatchQueue.main.async {
            spinner.removeFromSuperview()
        }
    }
}

