//
//  AccountViewController.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/19/22.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var savingsCollectionView: UICollectionView!
    
    @IBOutlet weak var userTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        savingsCollectionView.delegate = self
        savingsCollectionView.dataSource = self
        
        userTableView.delegate = self
        userTableView.dataSource = self
        
        userTableView.rowHeight = 45
        // Do any additional setup after loading the view.
    }

}

//MARK: - UICollectionView Delegate and DataSource Methods
extension AccountViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = savingsCollectionView.dequeueReusableCell(withReuseIdentifier: K.AccountVCCollectionViewCell, for: indexPath)
        
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


extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Profile \(section)"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = userTableView.dequeueReusableCell(withIdentifier: K.AccountVCTableViewCell, for: indexPath)
        return cell
    }
    
    
}