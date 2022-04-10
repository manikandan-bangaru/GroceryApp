//
//  ProductDetailsResponse.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import Foundation

class ProductDetailsModal : Decodable
{
    var id : Int?
    var price : String?
    var title : String?
    var imageUrl : String?
    var description : String?
    var allergyInformation : String?
}
