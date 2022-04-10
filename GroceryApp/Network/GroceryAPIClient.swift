//
//  GroceryAPIClient.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import Foundation
public typealias ImageGetRespHandler = (_ response: Data?, _ error: Error?) -> Void


class GroceryAPIClient : GroceryAPIDelegate{
    
    static var shared = GroceryAPIClient()
    
    private var imageCache = [URL : Data]()
    func getImageData(for url: URL , completionHandler : @escaping ImageGetRespHandler){
        if let data = self.imageCache[url]
        {
            completionHandler(data,nil)
        }
        else{
            APIClient.shared.taskForGETMethod(url: url) {[weak self] response, error in
                if let data = response as? Data
                {
                    self?.imageCache[url] = data
                    completionHandler(data,nil)
                }
                else{
                    completionHandler(nil,error)
                }
            }
        }
    }
    
    public func getProductList(apiURLComponents: GroceryAPIParams, completionHandlerForGET: @escaping HTTPGetRespHandler){
        if let url = apiURLComponents.getRequestURL(){
            APIClient.shared.cancelPreViousCalls()
            APIClient.shared.taskForGETMethod(url: url) { data, error in
                guard  error == nil else {
                    completionHandlerForGET(nil,error)
                    return
                }
                if let data = data{
                    do{
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(ProductListModal.self, from: data as! Data)
                        completionHandlerForGET(result,nil)
                    }catch{
                        
                    }
                }else{
                    completionHandlerForGET(nil,error)
                }
            }
        }else{
            completionHandlerForGET(nil,NSError(domain: "Invalid URL", code: 404, userInfo: nil))
        }
   
        
    }
    public func getProductDetails(apiURLComponents: GroceryAPIParams, completionHandlerForGET: @escaping HTTPGetRespHandler){
        if let url = apiURLComponents.getRequestURL(){
            APIClient.shared.taskForGETMethod(url: url) { data, error in
                guard  error == nil else {
                    completionHandlerForGET(nil,error)
                    return
                }
                if let data = data{
                    do{
                        let jsonDecoder = JSONDecoder()
                        let result = try jsonDecoder.decode(ProductDetailsModal.self, from: data as! Data)
                        completionHandlerForGET(result,nil)
                    }catch{
                        
                    }
                }else{
                    completionHandlerForGET(nil,error)
                }
            }
        }else{
            completionHandlerForGET(nil,NSError(domain: "Invalid URL", code: 404, userInfo: nil))
        }
    }
}
