//
//  ProductClusterViewModalTests.swift
//  GroceryAppTests
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import XCTest
import XCTest
@testable import GroceryApp

class ProductClusterViewModalTests: XCTestCase {

    func testProductClusterViewModal() throws {
        let mockProdModal = MockResponses.ProductListModalWithOneProd()
        let productViewModal = ProductClusterViewModal(cluster: mockProdModal.clusters!.first!)
        
        XCTAssertEqual(mockProdModal.clusters!.first!.tag , productViewModal.getClusterName())
        XCTAssertEqual(mockProdModal.clusters!.first!.items?.first?.title , productViewModal.getProductList()?.first?.getTitle())
        XCTAssertEqual(mockProdModal.clusters!.first!.items?.first?.size , productViewModal.getProductList()?.first?.getSize())
        XCTAssertEqual(mockProdModal.clusters!.first!.items?.first?.price , productViewModal.getProductList()?.first?.getPrice())
        XCTAssertEqual(mockProdModal.clusters!.first!.items?.first?.id , productViewModal.getProductList()?.first?.getProductID())
    }
}
