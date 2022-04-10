//
//  GroceryAppTests.swift
//  GroceryAppTests
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import XCTest
@testable import GroceryApp

class GroceryAppTests: XCTestCase {

    func testFetchProductListCall() throws {
        GroceryAPIClient.shared = MockGroceryAPI()
        
        let rootVC = RootViewController()
        
        rootVC.fetchProductDetails { response, error in
            var productClustersVM = [ProductClusterViewModal]()
            
            for cluster in MockResponses.ProductListModalWithOneProd().clusters!
            {
                productClustersVM.append(ProductClusterViewModal(cluster: cluster))
            }
            
            XCTAssertEqual(response!.count, productClustersVM.count)
            XCTAssertEqual(response!.first?.getClusterName(), productClustersVM.first!.getClusterName())
        }
    }
    func testFetchProductDetailsCall()
    {
        GroceryAPIClient.shared = MockGroceryAPI()
        
        let prodDetails = ProductDetailViewController()
        let prodDetailViewModal = ProductDetailViewModel(productDetailModal: MockResponses.ProductDetailsResponseWithAllValue())
        prodDetails.fetchProductDetails(for: 123) { response, error in
            XCTAssertEqual(response!.getImageURL(),prodDetailViewModal.getImageURL())
            XCTAssertEqual(response!.getPrice(),prodDetailViewModal.getPrice())
            XCTAssertEqual(response!.getTitle(),prodDetailViewModal.getTitle())
            XCTAssertEqual(response!.getDescription(),prodDetailViewModal.getDescription())
            XCTAssertEqual(response!.getAllergyInfo(),prodDetailViewModal.getAllergyInfo())
        }
    }


}
