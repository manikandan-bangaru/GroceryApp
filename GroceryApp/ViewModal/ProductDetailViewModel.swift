//
//  ProductDetailViewModel.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import UIKit

public class ProductDetailViewModel: NSObject {

    private var productDetailModal : ProductDetailsModal?
    
    init(productDetailModal : ProductDetailsModal) {
        self.productDetailModal = productDetailModal
    }
    
    public func getTitle() -> String?
    {
        return self.productDetailModal?.title
    }
    public func getImageURL() -> URL?
    {
        if let urlStr =  self.productDetailModal?.imageUrl
        {
            return URL(string: urlStr)
        }
        return nil
    }
    public func getDescription() -> String?
    {
        return self.productDetailModal?.description
    }
    public func getPrice() -> String?
    {
        return self.productDetailModal?.price
    }
    public func getAllergyInfo() -> String?
    {
        return self.productDetailModal?.allergyInformation
    }
    
}
