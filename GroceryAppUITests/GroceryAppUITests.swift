//
//  GroceryAppUITests.swift
//  GroceryAppUITests
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import XCTest

class GroceryAppUITests: XCTestCase {


    func testProductDetailsVCIsPresentable() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        app.tables.element(boundBy: 0).cells.element(boundBy: 0).tap()
        sleep(5)
       XCTAssertTrue(app.staticTexts["Price : $"].exists)
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
