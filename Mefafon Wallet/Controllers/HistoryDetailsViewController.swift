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
    
    var theImageURL: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: theImageURL!)
        productImage.sd_setImage(with: url)

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
