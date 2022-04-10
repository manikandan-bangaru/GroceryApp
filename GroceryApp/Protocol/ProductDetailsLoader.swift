//
//  ProductDetailsLoader.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import Foundation

public typealias ProductDetailsGetRespHandler = (_ response: ProductDetailViewModel?, _ error: Error?) -> Void

protocol ProductDetailsLoader
{
    func fetchProductDetails(for productID : Int64 , completionHandlerForGET: @escaping ProductDetailsGetRespHandler)
}
