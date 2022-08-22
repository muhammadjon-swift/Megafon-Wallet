//
//  TransferVCQuickCollectionViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/23/22.
//

import UIKit

class TransferVCQuickCollectionViewCell: UICollectionViewCell, PeopleCell {
    
        static let reuseIdentifier = String(describing: TransferVCQuickCollectionViewCell.self)
        @IBOutlet weak var image: UIImageView!
        @IBOutlet weak var title: UILabel!
        
        var gradientAdded = false
        
        func showPeople(people: People?) {
            image.makeRounded(borderColor: #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
            
            if !gradientAdded {
                gradientAdded = true
                image.addGradient()
            }
            
            image.image = people?.thumbnail
            title.text = people?.title
        }
}

extension UIImageView {
    func makeRounded(borderColor: CGColor? = nil, borderWidth: CGFloat = 2) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        layer.cornerRadius = frame.height / 2.2
        clipsToBounds = true
    }
    
    func addGradient(startColor: CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
                     , endColor: CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
                     , at position: UInt32 = 0) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [startColor, endColor]
        layer.insertSublayer(gradient, at: position)
    }
}
