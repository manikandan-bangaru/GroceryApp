//
//  ProductDetailViewController.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import UIKit

class ProductDetailViewController: UIViewController ,ProductDetailsLoader{
    
    
    
    @IBOutlet weak var prodImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    
    
    @IBOutlet weak var currencyLabel: UILabel!
    
    var productID : Int64?
    {
        didSet{
            guard let productID = productID else
            {
                return
            }
            fetchProductDetails(for: productID) {[weak self] response, error in
                if let productVM = response
                {
                    DispatchQueue.main.async {
                        self?.productDetailViewModel = productVM
                        self?.view.setNeedsDisplay()
                    }
                }
            }
        }
    }
    var productDetailViewModel : ProductDetailViewModel?
    {
        didSet{
            if let imgUrl = productDetailViewModel?.getImageURL()
            {
                GroceryAPIClient.shared.getImageData(for: imgUrl) { [weak self] response, error in
                    if let data = response
                    {
                        DispatchQueue.main.async {
                            self?.prodImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
            
            DispatchQueue.main.async {
                if let title = self.productDetailViewModel?.getTitle()
                {
                    self.titleLabel.text = title
                }
                if let des = self.productDetailViewModel?.getDescription()
                {
                    self.descLabel.text = des
                }
                if let price = self.productDetailViewModel?.getPrice()
                {
                    self.priceLabel.text = price
                }
                if let info = self.productDetailViewModel?.getAllergyInfo()
                {
                    self.infoLabel.text = info
                }
                self.currencyLabel.text = "Price : $"

            }
        }
    }
    func fetchProductDetails(for productID: Int64, completionHandlerForGET: @escaping ProductDetailsGetRespHandler) {
        
        let params = GroceryAPIParams.ProductDetailsParamBuilder()
            .set(productID: productID)
            .build()
        GroceryAPIClient.shared.getProductDetails(apiURLComponents: params) { response, error in
            if let productDetailModel = response as? ProductDetailsModal {
                completionHandlerForGET(ProductDetailViewModel(productDetailModal: productDetailModel),nil)
            }
            else{
                completionHandlerForGET(nil,error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
