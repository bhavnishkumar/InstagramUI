//
//  FeedViewModel_UnitTest.swift
//  InstagramUI
//
//  Created by Admin on 13/09/22.
//

import XCTest
@testable import InstagramUI
import SwiftUI

class FeedViewModel_UnitTest: XCTestCase {

    
    func test_Request_Returns_Response(){

        @ObservedObject var viewModel = FeedViewModel()
        XCTAssertNotNil(viewModel.feedlist)
        XCTAssertNotNil(viewModel.hightlights)
        XCTAssertTrue(false)
        
    }
    
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            test_Request_Returns_Response()
        }
    }


}
