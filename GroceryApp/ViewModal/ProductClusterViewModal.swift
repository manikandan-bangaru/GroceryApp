//
//  ProductClusterViewModal.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import Foundation

public class ProductClusterViewModal
{
    var productCluster : Cluster
    
    init(cluster : Cluster)
    {
        self.productCluster = cluster
    }
    func getClusterName() -> String?
    {
        return self.productCluster.tag
    }
    func getProductList() -> [ProductViewModel]?
    {
        var productsVM = [ProductViewModel]()
        if let items = self.productCluster.items
        {
            for item in items
            {
                let prodVM = ProductViewModel(productModal: item)
                productsVM.append(prodVM)
            }
        }
        return productsVM
    }
}
