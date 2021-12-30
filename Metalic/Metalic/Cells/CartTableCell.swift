//
//  CartTableCell.swift
//  Metalic
//
//  Created by Anas Hamad on 10/05/1443 AH.
//

import UIKit

//protocol CalculatePrice: AnyObject {
//    func totalPrice(_ cell: CartTableCell)
//}
class CartTableCell: UITableViewCell {

    @IBOutlet var orderPrice: UILabel!
    @IBOutlet var orderLabel: UILabel!
    @IBOutlet var cellView: UIView!
    @IBOutlet var orderImage: UIImageView!
    @IBOutlet var productDetail: UILabel!
    @IBOutlet var productTextField: UITextField!
    
  //  weak var delegate: CalculatePrice?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
