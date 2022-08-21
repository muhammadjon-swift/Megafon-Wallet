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
        
        transactionsTableView.rowHeight = 69

        // Do any additional setup after loading the view.
    }

    
}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transactionsTableView.dequeueReusableCell(withIdentifier: K.HistoryVCTableViewCell, for: indexPath)
        return cell
    }
    
    
}
