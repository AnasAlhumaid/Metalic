//
//  ShowProductCell.swift
//  Metalic
//
//  Created by Anas Hamad on 21/06/1443 AH.
//

import UIKit

class ShowProductCell: UITableViewCell {

    @IBOutlet var nameProductLabel: UILabel!
    @IBOutlet var cellView: UIView!
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var productInfo: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var cartImage: UIButton!
    var cartImageIsFill = false
    @IBOutlet var buttonCert: UIButton!
    @IBOutlet var addToCart: UIButton!
    
     var delegate: ItemCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func buttonTapped() {
          delegate?.itemCell(didTapButton: buttonCert)
      }
    
    
    
    
    
    
    
//    @IBAction func cartButton(_ sender: Any) {
//
//        let imageEmpty = UIImage(systemName: "cart.circle")
//        let image = UIImage(systemName: "cart.circle.fill")
//        if cartImage.imageView?.image == UIImage(systemName: "cart.circle") {
//            cartImage.setImage(image, for: .normal)
//            self.cartImageIsFill = true
//            print(cartImageIsFill)
//
//
//
//
//        }else{
//            cartImage.setImage(imageEmpty, for: .normal)
//
//
//        }
//
//
//
//
//    }
    
}
