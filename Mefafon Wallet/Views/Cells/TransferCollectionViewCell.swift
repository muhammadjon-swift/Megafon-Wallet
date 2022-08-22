//
//  PaymentsCollectionViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/21/22.
//

import UIKit
import Kingfisher

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
        let url = URL(string: viewModel.imageURL)
        itemDescriptionLabel.text = viewModel.description
        

        
        let cache = ImageCache.default
                
        let cached = cache.isCached(forKey: viewModel.description)
        print("Is it cached? \(cached)")

        let resource = ImageResource(downloadURL: url!, cacheKey: viewModel.imageURL)
        itemImage.kf.setImage(with: resource)
        // Prosses Image
        if let url = URL(string: (viewModel.imageURL)) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }

                DispatchQueue.main.async { /// execute on main thread
//                    self.itemImage.image = UIImage(data: data)
                    cache.storeToDisk(data, forKey: viewModel.description)
                }
            }
            task.resume()
        }
    }


}
