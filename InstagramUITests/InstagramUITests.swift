//
//  InstagramUITests.swift
//  InstagramUITests
//
//  Created by Admin on 13/09/22.
//

import XCTest
@testable import InstagramUI


class InstagramUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
   
    func testUserLoginModelStruc_canCreateNewInstance() {
        let sut = UserLoginModel.init(email: "", password: "")
           XCTAssertNotNil(sut)
    }
    
    //Check email empty
    func testUserEmailEmpty_validatecheck(){
        let viewModel = LoginViewModel()
        
        viewModel.credentials = UserLoginModel.init(email: "", password: "2434")
        
        let validationResult = viewModel.validatatioinCheck()
        XCTAssertFalse(validationResult.isValid)
        XCTAssertNotNil(validationResult.message)
        XCTAssertEqual(validationResult.message, "email cannot be empty")
        
    }
    
    //Check email valid
    func testUserEmailValid_validatecheck(){
        let viewModel = LoginViewModel()
        
        viewModel.credentials = UserLoginModel.init(email: "ab@", password: "2434")
        let validationResult = viewModel.validatatioinCheck()
        XCTAssertFalse(validationResult.isValid)
        XCTAssertNotNil(validationResult.message)
        XCTAssertEqual(validationResult.message, "enter valid email")
        
    }
    
    

    //Check password empty
    func testUserPasswordEmpty_validatecheck(){
        let viewModel = LoginViewModel()
        
        viewModel.credentials = UserLoginModel.init(email: "ab@gmail.com", password: "")
        let validationResult = viewModel.validatatioinCheck()
        XCTAssertFalse(validationResult.isValid)
        XCTAssertNotNil(validationResult.message)
        XCTAssertEqual(validationResult.message, "password cannot be empty")
        
    }
    
    
    //Check password valid
    func testUserPasswordValid_validatecheck(){
        let viewModel = LoginViewModel()
        
        viewModel.credentials = UserLoginModel.init(email: "ab@gmail.com", password: "34234")
        let validationResult = viewModel.validatatioinCheck()
        XCTAssertFalse(validationResult.isValid)
        XCTAssertNotNil(validationResult.message)
        XCTAssertEqual(validationResult.message, "enter valid password")
        
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
