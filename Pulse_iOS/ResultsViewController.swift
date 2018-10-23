//
//  ResultsViewController.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 9/2/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UITableViewController {
    var category: String!
    var selectedTimeZone: TimeZone!
    
    var usersArray : Array = [["first_name": "michael", "last_name": "jackson"], ["first_name" : "bill", "last_name" : "gates"], ["first_name" : "steve", "last_name" : "jobs"], ["first_name" : "mark", "last_name" : "zuckerberg"], ["first_name" : "anthony", "last_name" : "quinn"]]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new UIView and add it to the view controller
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib = UINib.init(nibName: "ResultListCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "ResultListCell")
        self.tableView.separatorStyle = .none
        
        print(category)
        print(selectedTimeZone.getCode())
        for state in selectedTimeZone.getStates() {
            print("STATE:")
            print(state.getCode())
            for resource in state.getAllResources() {
                print("RESOURCE:")
                print(resource.getName())
                print(resource.getUrl())
                print(resource.getPhoneNumber())
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - UITableView delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 151
    }
 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultListCell", for: indexPath) as! ResultCellTableViewCell
        
        return cell
    }
    
}
