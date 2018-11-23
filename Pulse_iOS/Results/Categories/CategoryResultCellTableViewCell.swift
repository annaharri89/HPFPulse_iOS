//
//  ResultCellTableViewCell.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 9/9/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import UIKit

class CategoryResultCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var orgName: UILabel!
    @IBOutlet weak var orgState: UILabel!
    var orgUrl: String!
    var orgPhone: String!
    
    //todo make openWebsite() and makeCall()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func openWebsite(_ sender: Any) {
        if let url = URL(string: self.orgUrl), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }

    @IBAction func makeCall(_ sender: Any) {
        if let url = URL(string: "tel:\(String(describing: self.orgPhone))"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
}
