//
//  ProfileViewController.swift
//  EmployeeList
//
//  Created by Shripal Jain on 30/03/17.
//  Copyright © 2017 Shripal Jain. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var name:String!
    var desg:String!
    var photo:UIImage!
    
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var desglabel: UILabel!
    
    @IBOutlet weak var profile: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        namelabel.text = desg
        desglabel.text = name
        profile.setImage(photo, for: .normal)
    }

}
