//
//  productViewModel.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import Foundation

public class ProductViewModel
{
    private var productModal : ProductModal?
    
    init(productModal : ProductModal) {
        self.productModal = productModal
    }
    
    public func getProductID() -> Int64?
    {
        return self.productModal?.id
    }
    public func getTitle() -> String?
    {
        return self.productModal?.title
    }
    public func getImageURL() -> URL?
    {
        if let urlStr =  self.productModal?.imageUrl
        {
            return URL(string: urlStr)
        }
        return nil
    }
    public func getSize() -> String?
    {
        return self.productModal?.size
    }
    public func getPrice() -> String?
    {
        return self.productModal?.price
    }
}
