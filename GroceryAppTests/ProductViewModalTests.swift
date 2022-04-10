//
//  ProductViewModalTests.swift
//  GroceryAppTests
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import XCTest
@testable import GroceryApp

class ProductViewModalTests: XCTestCase {

    func testProductViewModalWithAllValuesAvailable()  {
        
        let mockProdModal = MockResponses.ProductModalData()
        let productViewModal = ProductViewModel(productModal:mockProdModal )
        
        XCTAssertEqual(productViewModal.getProductID()!,mockProdModal.id!)
        XCTAssertEqual(productViewModal.getSize()!,mockProdModal.size!)
        XCTAssertEqual(productViewModal.getPrice()!,mockProdModal.price)
        let url = URL(string: mockProdModal.imageUrl!)!
        XCTAssertEqual(productViewModal.getImageURL()!,url)
    }

    func testProductViewModalWithNilImageURL()
    {
        let mockProdModal = MockResponses.ProductModalDataWithOutImageURL()
        let productViewModal = ProductViewModel(productModal:mockProdModal )
        XCTAssertTrue(productViewModal.getImageURL() == nil)
    }
    
    func testProductViewModalWithAllValuesNilValues()  {
        
        let mockProdModal = MockResponses.ProductModalDataWithAllNilValues()
        let productViewModal = ProductViewModel(productModal:mockProdModal )
        
        XCTAssertTrue(productViewModal.getProductID() == nil)
        XCTAssertTrue(productViewModal.getSize() == nil)
        XCTAssertTrue(productViewModal.getPrice() == nil)
        XCTAssertTrue(productViewModal.getImageURL() == nil)
    }


}
