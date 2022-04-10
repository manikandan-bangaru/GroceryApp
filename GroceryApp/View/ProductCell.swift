//
//  productCell.swift
//  GroceryApp
//
//  Created by Manikandan Bangaru on 10/04/22.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var prodImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    static var identifier : String{
        String(describing: self)
    }
    static var nib : UINib{
            UINib(nibName: identifier, bundle: Bundle.main)
    }
    
    var productViewModal : ProductViewModel?
    {
        didSet
        {
            if let imgUrl = productViewModal?.getImageURL()
            {
                GroceryAPIClient.shared.getImageData(for: imgUrl) {[weak self] response, error in
                    if let data = response
                    {
                        DispatchQueue.main.async {
                            self?.prodImageView.image = UIImage(data: data)
                        }
                    }
                }
            }
            if let title = productViewModal?.getTitle()
            {
                self.titleLabel.text = title
            }
            if let size = productViewModal?.getSize()
            {
                self.sizeLabel.text = size
            }
            if let price = productViewModal?.getPrice()
            {
                self.priceLabel.text = price
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView?.image = nil
    }
}
