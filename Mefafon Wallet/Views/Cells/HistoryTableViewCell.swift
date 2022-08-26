//
//  HistoryTableViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/25/22.
//

import UIKit
import SDWebImage

class ProductsHistoryTableViewCellViewModel {
    let title: String
    let thumbnail : String
    let rating: Float
    let price: Int
    let brand: String
    let discountPercentage: Float
    
    init(title: String, thumbnail:String, rating: Float, price: Int, brand: String, discountPercentage: Float) {
        self.title = title
        self.thumbnail = thumbnail
        self.rating = rating
        self.price = price
        self.brand = brand
        self.discountPercentage = discountPercentage
    }
    
}

class HistoryTableViewCell: UITableViewCell {
    @IBOutlet weak var transactionName: UILabel!
    @IBOutlet weak var transactionInOut: UILabel!
    @IBOutlet weak var transactionHour: UILabel!
    @IBOutlet weak var transactionDateAndYear: UILabel!
    @IBOutlet weak var transactionImage: UIImageView!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with viewModel: ProductsHistoryTableViewCellViewModel) {
        transactionName.text = viewModel.title
        transactionInOut.text = "$\(viewModel.price)"
        let url = URL(string: viewModel.thumbnail)
        // SDImage downloads and caches the image
        transactionImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        transactionImage.sd_imageIndicator = SDWebImageProgressIndicator.default
        
        transactionImage.sd_imageTransition = .fade
        transactionImage.sd_setImage(with: url)
        transactionDateAndYear.text = viewModel.brand
        transactionHour.text = "\(viewModel.rating)"
        
    }

}
