//
//  HistoryDetailTableViewCell.swift
//  Mefafon Wallet
//
//  Created by Muhammadjon Loves on 8/26/22.
//

import UIKit

class HistoryDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var infoFromAPI: UILabel!
    @IBOutlet weak var detailDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
