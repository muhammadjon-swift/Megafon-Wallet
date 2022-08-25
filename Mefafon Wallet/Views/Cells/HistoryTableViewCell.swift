//
//  HistoryTableViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/25/22.
//

import UIKit
import SDWebImage

class ItemsHistoryTableViewCellViewModel {
    let title: String
    let imageURL : String
    let price: Float
    
    
    init (title: String, imageURL: String, price: Float) {
        self.title = title
        self.imageURL = imageURL
        self.price = price
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
    
    func configure(with viewModel: ItemsHistoryTableViewCellViewModel) {
        transactionName.text = viewModel.title
        transactionInOut.text = "$\(viewModel.price)"
        let url = URL(string: viewModel.imageURL)
        // SDImage downloads and caches the image
        transactionImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        transactionImage.sd_imageIndicator = SDWebImageProgressIndicator.default
        
        transactionImage.sd_imageTransition = .fade
        transactionImage.sd_setImage(with: url)
        
    }

}
