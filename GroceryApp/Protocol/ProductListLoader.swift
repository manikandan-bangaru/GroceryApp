//
//  ProductListLoader.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import Foundation

public typealias ProductClusterGetRespHandler = (_ response: [ProductClusterViewModal]?, _ error: Error?) -> Void

protocol ProductListLoader
{
    func fetchProductDetails(completionHandlerForGET: @escaping ProductClusterGetRespHandler)
    
}
