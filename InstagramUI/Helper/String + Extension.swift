//
//  String + Extension.swift
//  Buntethered
//
//  Created by Admin on 29/11/21.
//

import Foundation
import UIKit

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
    
    
    func isValidName() -> Bool {
        //Declaring the rule of characters to be used. Applying rule to current state. Verifying the result.
        let regex = "[a-zA-Z\\s]+"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: self)
        
        return result
    }
    
    func validateName() -> Bool{
        let regex = "([A-Z][a-zA-Z @.#!~*%?&+-]*)"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let result = test.evaluate(with: self)
        
        return result
    }
    
    
    //MARK:- UserName Validation
    func isValidUsername(Username:String) -> Bool {
        let RegEx = "\\A\\w{4,12}\\z"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: Username)
    }
    
    
    
    var isPhoneNumber: Bool {
        do {
            let detector = try NSDataDetector(types: NSTextCheckingResult.CheckingType.phoneNumber.rawValue)
            let matches = detector.matches(in: self, options: [], range: NSMakeRange(0, self.count))
            if let res = matches.first {
                return res.resultType == .phoneNumber && res.range.location == 0 && res.range.length == self.count && self.count == 15
            } else {
                return false
            }
        } catch {
            return false
        }
    }
    
    
    // mobile no. validation
    func isValidPhoneNumber(_ phoneNumberString: String) -> Bool {
        
        var returnValue = true
        //        let mobileRegEx = "^[789][0-9]{9,11}$"
        let mobileRegEx = "^[0-9]{10}$"
        
        do {
            let regex = try NSRegularExpression(pattern: mobileRegEx)
            let nsString = phoneNumberString as NSString
            let results = regex.matches(in: phoneNumberString, range: NSRange(location: 0, length: nsString.length))
            
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
    
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    func removeHtmlFromString(inPutString: String) -> String{
        return inPutString.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
    func trim() -> String{
        return self.trimmingCharacters(in: .whitespaces)
    }
    
}

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
    
    //MARK:- CONVERSION
    //Converts String to Int
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
    
    //Converts String to Double
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
    
    /// EZSE: Converts String to Float
    public func toFloat() -> Float? {
        if let num = NumberFormatter().number(from: self) {
            return num.floatValue
        } else {
            return nil
        }
    }
    
    //Converts String to Bool
    public func toBool() -> Bool? {
        return (self as NSString).boolValue
    }
}


extension String {
    
    func toUTCDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{
        
        let dateFormatter = DateFormatter()
       dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateFormatter.locale = .none
        dateFormatter.dateFormat = format
        dateFormatter.calendar = .current
        let date = dateFormatter.date(from: self)
        
        return date
        
    }
    
    func toDate(withFormat format: String = "yyyy-MM-dd HH:mm:ss")-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .none
        dateFormatter.dateFormat = format
        dateFormatter.calendar = .current
        let date = dateFormatter.date(from: self)
        
        return date
        
    }
}


///MARK:- String Attributed  Extension
extension String {
    public var convertHtmlToNSAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data,options: [.documentType: NSAttributedString.DocumentType.html,.characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            print(error.localizedDescription)
            return nil
        }
    }
    
    public func convertHtmlToAttributedStringWithCSS(font: UIFont? , csscolor: String , lineheight: Int, csstextalign: String) -> NSAttributedString? {
        guard let font = font else {
            return convertHtmlToNSAttributedString
        }
        let modifiedString = "<style>body{font-family: '\(font.fontName)'; font-size:\(font.pointSize)px; color: \(csscolor); line-height: \(lineheight)px; text-align: \(csstextalign); }</style>\(self)";
        guard let data = modifiedString.data(using: .utf8) else {
            return nil
        }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        }
        catch {
            //print(error)
            return nil
        }
    }
}


extension String {

    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }

    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }

    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
}


extension String {
   func maxLength(length: Int) -> String {
       var str = self
       let nsString = str as NSString
       if nsString.length >= length {
           str = nsString.substring(with:
               NSRange(
                location: 0,
                length: nsString.length > length ? length : nsString.length)
           )
       }
       return  str
   }
}

