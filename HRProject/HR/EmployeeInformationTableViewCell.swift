//
//  EmployeeInformationTableViewCell.swift
//  HRProject
//
//  Created by Gaurav on 13/05/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//

import UIKit

class EmployeeInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameTxtLbl: UILabel!
    @IBOutlet weak var lastNameTxtLbl: UILabel!
    @IBOutlet weak var emailTxtLbl: UILabel!
    @IBOutlet weak var phoneTxtLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
