//
//  MyCollectionViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/19/22.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardImage: UIImageView!

    func setup(image: UIImage) {
            cardImage.image = image
        }

}
