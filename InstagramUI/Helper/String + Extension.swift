//
//  String + Extension.swift
//  InstgramUI
//
//  Created by Admin on 19/09/22.
//

import Foundation

//MARK:- String Extension
extension String {
    func isValidEmail() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^(([\\w-]+\\.)+[\\w-]+|([a-zA-Z]{1}|[\\w-]{2,}))@"
                                             + "((([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?"
                                             + "[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\."
                                             + "([0-1]?[0-9]{1,2}|25[0-5]|2[0-4][0-9])\\.([0-1]?"
                                             + "[0-9]{1,2}|25[0-5]|2[0-4][0-9])){1}|"
                                             + "([a-zA-Z]+[\\w-]+\\.)+[a-zA-Z]{2,4})$", options: .caseInsensitive)
        return regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: count)) != nil
    }
    
    
    func isValidPassword() -> Bool {
        let regularExpression = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&])[A-Za-z\\d$@$!%*?&]{8,}"
        let passwordValidation = NSPredicate.init(format: "SELF MATCHES %@", regularExpression)
        return passwordValidation.evaluate(with: self)
    }
    
    
    var isAlphanumeric: Bool {
            return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
        }
    
    
    func isValidUsername() -> Bool {
        guard self.count > 7, self.count < 18 else { return false }

        let predicateTest = NSPredicate(format: "SELF MATCHES %@", "^(([^ ]?)(^[a-zA-Z].*[a-zA-Z]$)([^ ]?))$")
        return predicateTest.evaluate(with: self)
    }
    
    
    
    var isNumber: Bool {
            return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
        }
    
    // mobile no. validation
    func isValidPhoneNumber() -> Bool {

        var returnValue = true
        //        let mobileRegEx = "^[789][0-9]{9,11}$"
        let mobileRegEx = "^[0-9]{10}$"

        do {
            let regex = try NSRegularExpression(pattern: mobileRegEx)
            let nsString = self as NSString
            let results = regex.matches(in: self, range: NSRange(location: 0, length: nsString.length))

            if results.count == 0
            {
                returnValue = false
            }

        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }

        return  returnValue
    }
    
    
}

