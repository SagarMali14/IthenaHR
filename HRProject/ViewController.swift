//
//  ViewController.swift
//  HRProject
//
//  Created by Felix IT on 11/05/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func TapForEmployee(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EmployeeReg") as? EmployeeReg
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func HRTap(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HRLogin") as? HRLogin
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

