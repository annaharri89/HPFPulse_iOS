//
//  AllResultsViewController.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 11/23/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

struct cellData {
    var opened = Bool()
    var title = String()
    var sectionData = [Resource]()
}
class AllResultsViewController: UITableViewController {
    var tableViewData = [cellData]()
    var selectedTimeZone: TimeZone!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new UIView and add it to the view controller
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.separatorStyle = .none
        
        
        for state in selectedTimeZone.getStates() {
            var stateResourceArray = [Resource]()
            for resource in selectedTimeZone.getAllStateResources(stateCode: state.getCode()) {
                stateResourceArray.append(resource)
            }
            tableViewData.append(cellData(opened: false, title: state.getName(), sectionData: stateResourceArray))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].opened == true {
            return tableViewData[section].sectionData.count + 1
        } else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dataIndex = indexPath.row - 1
        if indexPath.row == 0 {
            //title
            let nib = UINib.init(nibName: "AllResultsHeader", bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: "AllResultsHeader")
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllResultsHeader", for: indexPath) as! AllResultHeaderTableViewCell
            cell.textLabel?.text = tableViewData[indexPath.section].title
            return cell
        } else {
            //resources
            let nib = UINib.init(nibName: "AllResultListCell", bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: "AllResultListCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllResultListCell", for: indexPath) as! AllResultCellTableViewCell
            
            let resource = tableViewData[indexPath.section].sectionData[dataIndex]
            cell.orgName.text = resource.getName()
            cell.orgCategory.text = resource.getCategory()
            cell.orgPhone = resource.getPhoneNumber()
            cell.orgUrl = resource.getUrl()
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if tableViewData[indexPath.section].opened == true {
                tableViewData[indexPath.section].opened = false
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)//todo get the animation right
            } else {
                tableViewData[indexPath.section].opened = true
                let sections = IndexSet.init(integer: indexPath.section)
                tableView.reloadSections(sections, with: .none)//todo get the animation right
            }
        }
    }
}
