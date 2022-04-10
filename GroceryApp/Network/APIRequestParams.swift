//
//  APIRequestParams.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import Foundation

public class APIRequestParams {
    var  host : String
    var  path : String
    public init(apiPath : String)
    {
        self.path = apiPath
        self.host = APIRequestParamConstants.Host
    }
    public class APIRequestParamsBuilder {
        var apiPath: String

        init(apiPath: String) {
            self.apiPath = apiPath
        }
    }
}

public class GroceryAPIParams : APIRequestParams
{
    var productID : Int64?
    
    init(apiPath : String , builder : ProductListParamBuilder) {
        super.init(apiPath: apiPath)
    }
    
    init(apiPath : String , builder : ProductDetailsParamBuilder) {
        self.productID = builder.productID
        super.init(apiPath: apiPath)
    }
    
    public func getRequestURL() -> URL?
    {
        if productID != nil
        {
            self.path = self.path + "\(productID ?? 0)"
        }
        var urlComponents = URLComponents(string: self.host)
        urlComponents?.path = self.path
        return urlComponents?.url
    }
    
    public  class ProductListParamBuilder: APIRequestParams.APIRequestParamsBuilder {
        var cityName : Int64?
        init() {
            super.init(apiPath: APIRequestParamConstants.productListPath)
        }
        public  func build() -> GroceryAPIParams{
            return GroceryAPIParams(apiPath: self.apiPath, builder: self)
        }
    }
    public  class ProductDetailsParamBuilder: APIRequestParams.APIRequestParamsBuilder {
        var productID : Int64?
        init() {
            super.init(apiPath: APIRequestParamConstants.productDetailPath)
        }
        
        public  func set(productID : Int64)->ProductDetailsParamBuilder{
            self.productID = productID
            return self
        }
        public  func build() -> GroceryAPIParams{
            return GroceryAPIParams(apiPath: self.apiPath, builder: self)
        }
    }
}
