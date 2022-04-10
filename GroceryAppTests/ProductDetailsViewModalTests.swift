//
//  ProductDetailsViewModalTests.swift
//  GroceryAppTests
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import XCTest
import XCTest
@testable import GroceryApp

class ProductDetailsViewModalTests: XCTestCase {

    func testProductDetailsViewModalWithAllValuesAvailable()  {
        
        let mockProdModal = MockResponses.ProductDetailsResponseWithAllValue()
        let productViewModal = ProductDetailViewModel(productDetailModal:mockProdModal )
        
        XCTAssertEqual(productViewModal.getTitle(),mockProdModal.title!)
        XCTAssertEqual(productViewModal.getDescription()!,mockProdModal.description!)
        XCTAssertEqual(productViewModal.getPrice()!,mockProdModal.price)
        let url = URL(string: mockProdModal.imageUrl!)!
        XCTAssertEqual(productViewModal.getImageURL()!,url)
        XCTAssertEqual(productViewModal.getAllergyInfo()!,mockProdModal.allergyInformation)
    }


}
