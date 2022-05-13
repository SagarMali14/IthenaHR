//
//  Validation.swift
//  HRProject
//
//  Created by Gaurav on 13/05/22.
//  Copyright © 2022 Felix IT. All rights reserved.
//

import Foundation

class Validation {
    
    public func validateEmail(emailId: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let trimmerdString = emailId.trimmingCharacters(in: .whitespaces)
        let validEmail = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        let isValidEmail = validEmail.evaluate(with: trimmerdString)
        return isValidEmail
    }
    
    public func validatePassword(password: String) -> Bool {
        let passRegEx = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[d$@$!%*?&#])[A-Za-z\\dd$@$!%*?&#]{8,}"
        let trimmerdString = password.trimmingCharacters(in: .whitespaces)
        let validPass = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        let isValidPass = validPass.evaluate(with: trimmerdString)
        return isValidPass
    }
    
    public func validatePhoneNumber(phoneNo: String) -> Bool {
        let phoneNoRegEx = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let trimmerdString = phoneNo.trimmingCharacters(in: .whitespaces)
        let validPhone = NSPredicate(format: "SELF MATCHES %@", phoneNoRegEx)
        let isValidPhone = validPhone.evaluate(with: trimmerdString)
        return isValidPhone
    }
}
