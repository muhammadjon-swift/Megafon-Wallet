//
//  HistoryDetailsViewController.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/26/22.
//

import UIKit
import SDWebImage

class HistoryDetailsViewController: UIViewController {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var detailtableView: UITableView!
    
    var selectedProduct: Products?
    
    var data = [String]()
    var arrayDescriptions: [String] = [
        "Name",
        "BrandName",
        "Price",
        "DiscountPercentage",
        "Rating",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var infoFromAPIArray: [String] = [
            selectedProduct!.title,
            selectedProduct!.brand,
            "\(selectedProduct!.price)",
            "\(selectedProduct!.discountPercentage)%",
            "\(selectedProduct!.rating)",
        ]
        data = infoFromAPIArray
        let url = URL(string: selectedProduct!.thumbnail)
        productImage.sd_setImage(with: url)
        
        detailtableView.delegate = self
        detailtableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension HistoryDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailtableView.dequeueReusableCell(withIdentifier: "detailVCTableViewCell", for: indexPath) as! HistoryDetailTableViewCell
        cell.infoFromAPI.text = data[indexPath.row]
        cell.detailDescription?.text = arrayDescriptions[indexPath.row]
        return cell
    }
    
    
}
