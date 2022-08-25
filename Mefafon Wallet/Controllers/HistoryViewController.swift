//
//  HistoryViewController.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/19/22.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var transactionsTableView: UITableView!
    
    var theViewModels = [ItemsHistoryTableViewCellViewModel]()
    var items = [Items]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        
        transactionsTableView.rowHeight = 70
        
        APICaller.shared.fetchData { result in
            switch result {
            case .success(let items):
                self.items = items
                
                self.theViewModels = items.compactMap({ItemsHistoryTableViewCellViewModel(title: $0.title, imageURL: $0.image, price: $0.price)})
                
                DispatchQueue.main.async {
                    self.transactionsTableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }
    
}


//MARK: - UITableView Delegate & Datasource Methods
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: K.HistoryVCTableViewCell, for: indexPath) as! HistoryTableViewCell
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.3
        cell.transactionImage.layer.cornerRadius = 8;
        cell.transactionImage.layer.masksToBounds = true;
        cell.configure(with: theViewModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "transactionDetailVC", sender: self)
    }
    
    
    
}
