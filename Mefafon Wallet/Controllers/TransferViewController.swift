//
//  TransferViewController.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/19/22.
//

import UIKit

class TransferViewController: UIViewController {
    
    @IBOutlet weak var paymentsTableVIew: UITableView!
    @IBOutlet weak var paymentsCollectionView: UICollectionView!
    
    
    struct Service {
        let title: String
        let imageName: String
        let color: UIColor
    }
    
    let data: [Service] = [
        Service(title: "Electricity", imageName:"lightbulb.fill", color: UIColor(hexString: "FFD33D")!),
    Service(title: "Internet", imageName: "wifi", color: UIColor(hexString: "753EE7")!),
    Service(title: "Assurance", imageName: "pills.fill", color: UIColor(hexString: "F14142")!),
    Service(title: "Merchant", imageName: "cart.fill", color: UIColor(hexString: "50CD87")!),
    Service(title: "Mobile Sevices", imageName: "iphone", color: UIColor(hexString: "4C4EDC")!),
    Service(title: "Gosuslugi", imageName: "mail.stack", color: UIColor(hexString: "4C4EDC")!),
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentsTableVIew.delegate = self
        paymentsTableVIew.dataSource = self
        paymentsTableVIew.rowHeight = 60
        
        paymentsCollectionView.delegate = self
        paymentsCollectionView.dataSource = self

        // Do any additional setup after loading the view.
    }
    

}

//MARK: - UITableView Delegate & Datasource Methods
extension TransferViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paymentsTableVIew.dequeueReusableCell(withIdentifier: K.TransferVCTableViewCell, for: indexPath) as! TransferTableViewCell
        
        let service = data[indexPath.row]
        cell.serviceName.text = service.title
        cell.serviceImage.image = UIImage(systemName: service.imageName)
        cell.serviceImage.tintColor = service.color
        
        return cell
    }
    
    
}

//MARK: - UICollectionView Delegate & Datasource Methods
extension TransferViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = paymentsCollectionView.dequeueReusableCell(withReuseIdentifier: K.TransferVCCollectionViewCell, for: indexPath)
        return cell
    }
    
    
}
