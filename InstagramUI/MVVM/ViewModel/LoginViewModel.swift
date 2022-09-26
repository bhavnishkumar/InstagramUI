//
//  LoginViewModel.swift
//  InstagramUI
//
//  Created by Admin on 19/09/22.
//

import Foundation
import SwiftUI


struct ValidationResponse {
    let message: String?
    let isValid: Bool
}



class LoginViewModel:ObservableObject {
    
    @Published var isLogin:Bool = false
    @Published var errorMessage:ValidationResponse?
    //Here our model notify that was updated
    
    @Published var isToast = false
    
    
    
    var credentials:UserLoginModel = UserLoginModel.init(email: "", password: ""){
        didSet {
            
        }
    }
    
    func loginApi(){
        let validationResult = validatatioinCheck()
        
        if validationResult.isValid == true {
            
            if credentials.email == "bhavnish60@gmail.com" && credentials.password == "Bhavnish@1234"{
                isLogin = true
            }else{
                //Credentila not valid
                isLogin = false
                isToast = true
                errorMessage = ValidationResponse(message: "Credentials not matched!", isValid: false)
            }
            
        }else{
            //  print(validationResult)
            isToast = true
            errorMessage = validationResult
        }
    }
    
    //Validation check method
    func validatatioinCheck()->ValidationResponse{
        if credentials.email.isEmpty{
            return  ValidationResponse(message: "Email cannot be empty", isValid: false)
            
        } else if credentials.email.contains("@") && credentials.email.isValidEmail() == false{
            return ValidationResponse(message: "Enter valid email", isValid: false)
        } else if !credentials.email.isNumber && credentials.email.isAlphanumeric && credentials.email.isValidUsername() == false{
            return ValidationResponse(message: "Enter valid username", isValid: false)
        }
        else if credentials.email.isNumber && credentials.email.isValidPhoneNumber() == false{
            return ValidationResponse(message: "Enter valid phone number", isValid: false)
        }
        else if credentials.password.isEmpty{
            return ValidationResponse(message: "Password cannot be empty", isValid: false)
        }else if credentials.password.isValidPassword()  == false {
            return ValidationResponse(message: "Enter valid password", isValid: false)
        }
        return ValidationResponse(message: "", isValid: true)
    }
}
