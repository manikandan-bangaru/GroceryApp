//
//  GroceryAPIMock.swift
//  GroceryAppTests
//
//  Created by Manikandan Bangaru on 10/04/22.
//

@testable import GroceryApp
import UIKit

public class MockGroceryAPI: GroceryAPIClient {
    public override func getImageData(for url: URL, completionHandler: @escaping ImageGetRespHandler) {
        let data = Data()
        completionHandler(data,nil)
    }
    
    public override func getProductList(apiURLComponents: GroceryAPIParams, completionHandlerForGET: @escaping HTTPGetRespHandler) {
       
        completionHandlerForGET(MockResponses.ProductListModalWithOneProd(),nil)
    }
    
    public override func getProductDetails(apiURLComponents: GroceryAPIParams, completionHandlerForGET: @escaping HTTPGetRespHandler) {
        completionHandlerForGET(MockResponses.ProductDetailsResponseWithAllValue(),nil)
    }
}
class MockResponses
{
    static func ProductListModalWithOneProd() -> ProductListModal
    {
        
        let cluster = Cluster()
        cluster.tag = "TestHeader1"
        cluster.items = [MockResponses.ProductModalData()]
        let prodList = ProductListModal()
        prodList.clusters = [cluster]
        return prodList
    }
    static func ProductModalData() -> ProductModal
    {
        let prod1 = ProductModal()
        prod1.id = 1
        prod1.price = "2.31"
        prod1.imageUrl = "https://www.dummyURL.com"
        prod1.size = "12"
        return prod1
    }
    static func ProductModalDataWithOutImageURL() -> ProductModal
    {
        let prod1 = ProductModal()
        prod1.id = 1
        prod1.price = "2.31"
        prod1.imageUrl = nil
        prod1.size = "12"
        return prod1
    }
    static func ProductModalDataWithAllNilValues() -> ProductModal
    {
        let prod1 = ProductModal()
        prod1.id = nil
        prod1.price = nil
        prod1.imageUrl = nil
        prod1.size = nil
        return prod1
    }
    static func ProductDetailsResponseWithAllValue() -> ProductDetailsModal
    {
        let prod1 = ProductDetailsModal()
        prod1.id = 1
        prod1.title = "title"
        prod1.price = "2.31"
        prod1.imageUrl = "https://dummyURL.com"
        prod1.description = "12"
        prod1.allergyInformation = "NO"
        return prod1
    }
}
