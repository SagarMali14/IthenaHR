//
//  EmployeeReg.swift
//  HRProject
//
//  Created by Felix IT on 12/05/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EmployeeReg: UIViewController {
    
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var eamilId: UITextField!
    @IBOutlet weak var technology: UITextField!
    @IBOutlet weak var phoneNo: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var technologye = ""
    var validation = Validation()
    var tapGesture: UITapGestureRecognizer!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func tapped() {
        view.endEditing(true)
    }
    
    @IBAction func onTapOfRegister(_ sender: UIButton) {
        
        let newEmployees = Employee(context: context)
        guard let email = eamilId.text, let phone = phoneNo.text else {
            return
        }
        //validation code
        let isvalidEmail = self.validation.validateEmail(emailId: email)
        if (isvalidEmail == false){
            print("Invalid EmailID")
            return
        }
        let isValidPhone = self.validation.validatePhoneNumber(phoneNo: phone)
        if (isValidPhone == false) {
            print("Incorrect PhoneNo")
            return
        }
        if (isvalidEmail == true || isValidPhone == true) {
            print("All Fields are Correct")
            newEmployees.phoneNo = phoneNo.text
            newEmployees.technology = technology.text
        } else {
            print("Invalid Email or Phone")
        }

        newEmployees.firstName = firstName.text
        newEmployees.lastName = lastName.text
        newEmployees.emailId = eamilId.text
        newEmployees.phoneNo = phoneNo.text
        newEmployees.technology = technology.text
        do {
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

//PickerViewCode
extension EmployeeReg: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Technologies.techListArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Technologies.techListArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let technology1 = Technologies.techListArray[row]
        technology.text = technology1
        pickerView.isHidden = true
    }
}

extension EmployeeReg: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        pickerView.isHidden = false
        return false
    }
}

