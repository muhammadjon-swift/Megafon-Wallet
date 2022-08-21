//
//  HistoryViewController.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/19/22.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var transactionsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        transactionsTableView.delegate = self
        transactionsTableView.dataSource = self
        
        transactionsTableView.rowHeight = 70
        // Do any additional setup after loading the view.
    }
    
}

//MARK: - UITableView Delegate & Datasource Methods
extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: K.HistoryVCTableViewCell, for: indexPath)
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.3
        return cell
    }
    
    
    
}
