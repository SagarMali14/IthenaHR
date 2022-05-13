//
//  HRLogin.swift
//  HRProject
//
//  Created by Felix IT on 12/05/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

class HRLogin: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var validation = Validation()
    let hrUsername = "sanjivani@ithena.ai"
    let hrPassword = "Sanjivani@22"
    
    @IBAction func onTouchOfLogin(_ sender: UIButton) {
        guard let email = userName.text, let password = password.text else {
            return
        }
        let isValidEmail = self.validation.validateEmail(emailId: email)
        if (isValidEmail == false) {
            print("Invalid EmailId")
            self.view.makeToast("Invalid EmailId or Password", duration:2.0, position: .top)
            return
        }
        let isvalidPass = self.validation.validatePassword(password: password)
        if (isvalidPass == false) {
            print("Invalid Password")
            self.view.makeToast("Invalid EmailId or Password", duration:2.0, position: .top)
            return
        }
        if(isValidEmail == true || isvalidPass == true || hrUsername == email || hrPassword == password){
            print("All Fields are correct")
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TechList") as? TechList
            self.navigationController?.pushViewController(vc!, animated: true)
        }
   }
}
