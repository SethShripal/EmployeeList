//
//  EmpTableViewCell.swift
//  EmployeeList
//
//  Created by Shripal Jain on 30/03/17.
//  Copyright © 2017 Shripal Jain. All rights reserved.
//

import UIKit

class EmpTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UIButton!
    
    @IBOutlet weak var desg: UIButton!
    
    @IBOutlet weak var profilepic: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
