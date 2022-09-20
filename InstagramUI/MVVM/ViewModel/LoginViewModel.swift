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
    
    //Here our model notify that was updated
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
            }
            
        }else{
            print(validationResult)
        }
    }
    
    //Validation check method
     func validatatioinCheck()->ValidationResponse{
        if credentials.email.isEmpty{
           return  ValidationResponse(message: "email cannot be empty", isValid: false)
            
        }else if credentials.email.isValidEmail() == false{
            return ValidationResponse(message: "enter valid email", isValid: false)
        }else if credentials.password.isEmpty{
            return ValidationResponse(message: "password cannot be empty", isValid: false)
        }else if credentials.password.isValidPassword()  == false {
            return ValidationResponse(message: "enter valid password", isValid: false)
        }
        return ValidationResponse(message: "", isValid: true)
    }
}
