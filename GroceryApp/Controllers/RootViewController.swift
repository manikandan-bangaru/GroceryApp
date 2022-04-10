//
//  ViewController.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import UIKit

class RootViewController: UIViewController ,ProductListLoader{
   
    
    func fetchProductDetails(completionHandlerForGET: @escaping ProductClusterGetRespHandler) {
        let params = GroceryAPIParams.ProductListParamBuilder()
            .build()
        GroceryAPIClient.shared.getProductList(apiURLComponents: params) { response, error in
            if let productListModal = response as? ProductListModal {
                
                var productClustersVM = [ProductClusterViewModal]()
                if let clusters = productListModal.clusters
                {
                    for cluster in clusters
                    {
                        productClustersVM.append(ProductClusterViewModal(cluster: cluster))
                    }
                }
                completionHandlerForGET(productClustersVM,nil)
            }
            else{
                completionHandlerForGET(nil,error)
            }
        }
    }
    
    var productClusters : [ProductClusterViewModal]?
    {
        didSet
        {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchProductDetails {[weak self] response, error in
            if let productCluster = response
            {
                self?.productClusters = productCluster
            }
        }
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(ProductCell.nib, forCellReuseIdentifier: ProductCell.identifier)
    }

}
extension RootViewController : UITableViewDataSource,UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return productClusters?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productClusters?[section].getProductList()?.count ?? 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return productClusters?[section].getClusterName()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier) as? ProductCell
        {
            cell.productViewModal = productClusters?[indexPath.section].getProductList()?[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let productDetailVC = storyBoard.instantiateViewController(withIdentifier: "ProductDetailViewController") as? ProductDetailViewController
        if let prodID = productClusters?[indexPath.section].getProductList()?[indexPath.row].getProductID() , let productDetailVC = productDetailVC
        {
            productDetailVC.productID = prodID
            self.present(productDetailVC, animated: true)
        }
    }
}

