//
//  PaymentsCollectionViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/21/22.
//

import UIKit

class ItemsCollectionViewCellViewModel {
    let description: String
    let imageURL : String
    
    init (description: String, imageURL: String) {
        self.description = description
        self.imageURL = imageURL
    }
}

class TransferCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    func configure(with viewModel: ItemsCollectionViewCellViewModel) {
        itemDescriptionLabel.text = viewModel.description
        
        // Prosses Image
        if let url = URL(string: (viewModel.imageURL)) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.itemImage.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }


}
