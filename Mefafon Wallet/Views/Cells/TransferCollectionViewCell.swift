//
//  PaymentsCollectionViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/21/22.
//

import UIKit
import SDWebImage

class ItemsCollectionViewCellViewModel {
    let description: String
    let imageURL : String
    
    init (description: String, imageURL: String) {
        self.description = description
        self.imageURL = imageURL
    }
}

class LocalItemsCollectionViewCellViewModel {
    let title: String
    let imagePath : String
    
    init (title: String, imagePath: String) {
        self.title = title
        self.imagePath = imagePath
    }
}

class TransferCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    
    func configure(with viewModel: ItemsCollectionViewCellViewModel) {
        print("It was called")
        let url =  URL(string: viewModel.imageURL)
        itemDescriptionLabel.text = viewModel.description
        // SDImage downloads and caches the image
        itemImage.sd_setImage(with: url)
        
        // Downloads and stores the API data in Core Data 
        DataPersistenceManager.shared.downloadItemsWith(model: viewModel) { result in
            switch result {
            case .success(): break
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func configureLocalData(with viewModel: LocalItemsCollectionViewCellViewModel) {
        let url =  URL(string: viewModel.imagePath )
        itemDescriptionLabel.text = viewModel.title
        // SDImage downloads and caches the image
        itemImage.sd_setImage(with: url)
    }

}
