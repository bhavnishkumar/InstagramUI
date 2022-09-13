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
        XCTAssertTrue(true)
        
    }


}
