//
//  AllResultCellTableViewCell.swift
//  Pulse_iOS
//
//  Created by Anna Harrison on 11/23/18.
//  Copyright © 2018 The Humanity Preservation Foundation. All rights reserved.
//

import UIKit

class AllResultHeaderTableViewCell: UITableViewCell {
    
    //todo make openWebsite() and makeCall()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = UIColor.buttonBlue()
        self.layer.cornerRadius = 10
        self.textLabel?.textColor = UIColor.white
    
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
