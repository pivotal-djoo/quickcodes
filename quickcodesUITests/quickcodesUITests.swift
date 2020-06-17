//
//  quickcodesUITests.swift
//  quickcodesUITests
//
//  Created by david on 2020-06-16.
//  Copyright © 2020 djoo. All rights reserved.
//

import XCTest

class quickcodesUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testThreeModes() throws {
        let app = XCUIApplication()
        app.launch()
        
        let screen = XCUIApplication().windows
        
        assert(screen/*@START_MENU_TOKEN@*/.radioButtons["Jane Doe QR"]/*[[".radioGroups.radioButtons[\"Jane Doe QR\"]",".radioButtons[\"Jane Doe QR\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        assert(screen/*@START_MENU_TOKEN@*/.radioButtons["Random QR"]/*[[".radioGroups.radioButtons[\"Random QR\"]",".radioButtons[\"Random QR\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        assert(screen/*@START_MENU_TOKEN@*/.radioButtons["Random Datamatrix"]/*[[".radioGroups.radioButtons[\"Random Datamatrix\"]",".radioButtons[\"Random Datamatrix\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.exists)
        
        screen/*@START_MENU_TOKEN@*/.radioButtons["Jane Doe QR"]/*[[".radioGroups.radioButtons[\"Jane Doe QR\"]",".radioButtons[\"Jane Doe QR\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.click()
        assert(screen.staticTexts["{\n    \"firstName\": \"Jane\",\n    \"lastName\": \"Doe\",\n    \"dob\": \"1900-03-04\",\n    \"email\": \"jdoe@jdoe.com\",\n    \"oid\": \"user-oid\"\n}"].exists)
        
        screen/*@START_MENU_TOKEN@*/.radioButtons["Random QR"]/*[[".radioGroups.radioButtons[\"Random QR\"]",".radioButtons[\"Random QR\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.click()
        assert(screen.staticTexts["{\n    \"firstName\": \"Jane\",\n    \"lastName\": \"Doe\",\n    \"dob\": \"1900-03-04\",\n    \"email\": \"jdoe@jdoe.com\",\n    \"oid\": \"user-oid\"\n}"].exists == false)

        screen/*@START_MENU_TOKEN@*/.radioButtons["Random Datamatrix"]/*[[".radioGroups.radioButtons[\"Random Datamatrix\"]",".radioButtons[\"Random Datamatrix\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.click()
        assert(screen.staticTexts["{\n    \"firstName\": \"Jane\",\n    \"lastName\": \"Doe\",\n    \"dob\": \"1900-03-04\",\n    \"email\": \"jdoe@jdoe.com\",\n    \"oid\": \"user-oid\"\n}"].exists == false)
    }
}
