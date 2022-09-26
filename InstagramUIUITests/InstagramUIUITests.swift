//
//  InstagramUIUITests.swift
//  InstagramUIUITests
//
//  Created by Admin on 20/09/22.
//

import XCTest

class InstagramUIUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testLogin()  {
        let app = XCUIApplication()
        //app.launchArguments = ["isRunningUITests"]
        app.launch()

        let timeout = 2
        let loginButton = app.buttons["loginButton"]
        XCTAssertTrue(loginButton.waitForExistence(timeout: TimeInterval(timeout)))
       

        let usernameInputField = app.textFields["email_textfield"]
        let passwordInputField = app.secureTextFields["password_textfield"]
       
        
        XCTAssertTrue(usernameInputField.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(passwordInputField.waitForExistence(timeout: TimeInterval(timeout)))
        XCTAssertTrue(loginButton.waitForExistence(timeout: TimeInterval(timeout)))
     

        usernameInputField.tap()
        usernameInputField.typeText("bhavnish60@gmail.com")

        passwordInputField.tap()
        passwordInputField.typeText("Bhavnish@1234")

        loginButton.tap()
     
        
    }

    
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch //your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
