//
//  GroceryAPIDelegate.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import UIKit
protocol GroceryAPIDelegate {
    func getImageData(for url : URL , completionHandler : @escaping ImageGetRespHandler)
    func getProductList(apiURLComponents: GroceryAPIParams, completionHandlerForGET: @escaping HTTPGetRespHandler)
    func getProductDetails(apiURLComponents: GroceryAPIParams, completionHandlerForGET: @escaping HTTPGetRespHandler)
}
