//
//  ViewController.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/18/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let images: [UIImage] = Array(25 ... 28).map { UIImage(named: String($0))! }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

}

//MARK: - UICollectionView Delegate & Datasource Methods
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.HomeVCCollectionViewCell , for: indexPath) as! MyCollectionViewCell
        cell.setup(image: images[indexPath.row])
        
        //MARK: - Just to make corners rounded and add shadow
        let cornerRadius: CGFloat = 5.0
        cell.contentView.layer.cornerRadius = cornerRadius
        cell.contentView.layer.masksToBounds = true;
        cell.layer.cornerRadius = cornerRadius
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 0.10
        cell.layer.masksToBounds = false;
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 5)
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds,cornerRadius: cornerRadius).cgPath
        
        return cell
    }
    
    
}

