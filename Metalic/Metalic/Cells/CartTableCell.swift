//
//  CartTableCell.swift
//  Metalic
//
//  Created by Anas Hamad on 10/05/1443 AH.
//

import UIKit

class CartTableCell: UITableViewCell {

    @IBOutlet var orderPrice: UILabel!
    @IBOutlet var orderLabel: UILabel!
    @IBOutlet var orderImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
