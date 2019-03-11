//
//  ResultsViewController.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 9/2/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class CategoryResultsViewController: UITableViewController {
    var category: String!
    var selectedTimeZone: TimeZone!
    var resourcesArray = [Resource]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new UIView and add it to the view controller
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib = UINib.init(nibName: "CategoryResultListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "CategoryResultListCell")
        self.tableView.separatorStyle = .none
        
        for state in selectedTimeZone.getStates() {
            switch category {
            case Config.categories.BULLYING:
                for resource in selectedTimeZone.getStateBullyingResources(stateCode: state.getCode()) {
                    resourcesArray.append(resource)
                }
            case Config.categories.DOMESTIC_VIOLENCE:
                for resource in selectedTimeZone.getStateDomesticViolenceResources(stateCode: state.getCode()) {
                    resourcesArray.append(resource)
                }
            default:
                for resource in selectedTimeZone.getStateChildAbuseResources(stateCode: state.getCode()) {
                    resourcesArray.append(resource)
                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resourcesArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryResultListCell", for: indexPath) as! CategoryResultCellTableViewCell
        
        let resource = resourcesArray[indexPath.row]
        cell.orgName.text = resource.getName()
        cell.orgState.text = resource.getStateName()
        cell.orgPhone = resource.getPhoneNumber()
        cell.orgUrl = resource.getUrl()
        
        return cell
    }
    
}
