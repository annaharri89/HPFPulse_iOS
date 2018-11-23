////
//  MainViewController.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 6/7/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    var category: String!
    
    //MARK: Properties
    @IBOutlet weak var contactHPFToAdd: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let contactHPFToAdd_string = NSMutableAttributedString(string:"If you wish to have your organization listed, please contact us via the HPF Contact Page")
        let range = (contactHPFToAdd_string.string as NSString).range(of: "HPF Contact Page", options: String.CompareOptions.caseInsensitive)
        contactHPFToAdd_string.addAttribute(NSAttributedStringKey.link, value: "http://humanitypreservationfoundation.org/contact/", range: range)
        self.contactHPFToAdd.attributedText = contactHPFToAdd_string
        
        // create a new UIView and add it to the view controller
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //self.view.addSubview(mapView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    @IBAction func call911(_ sender: UIButton) {
        let phoneNumber = "911"
        if let url = URL(string: "tel:\(phoneNumber)"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MapViewController
        if (segue.identifier == "AllResourcesToMap") {
            vc.category = Config.categories.ALL_RESOURCES
        } else if (segue.identifier == "ChildAbuseToMap") {
            vc.category = Config.categories.CHILD_ABUSE
        } else if (segue.identifier == "BullyingToMap") {
            vc.category = Config.categories.BULLYING
        } else if (segue.identifier == "DomesticViolenceToMap") {
            vc.category = Config.categories.DOMESTIC_VIOLENCE
        }
    }
}
