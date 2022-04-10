//
//  APIResponse.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import Foundation

class ProductListModal : Decodable
{
    var clusters : [Cluster]?
}

class Cluster : Decodable
{
    var tag : String?
    var items : [ProductModal]?
}
class ProductModal : Decodable
{
    var id : Int64?
    var price : String?
    var title : String?
    var size : String?
    var imageUrl : String?
}
