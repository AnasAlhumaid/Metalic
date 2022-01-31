//
//  CartTableCell.swift
//  Metalic
//
//  Created by Anas Hamad on 10/05/1443 AH.
//

import UIKit

protocol CalculatePrice: AnyObject {
    func totalPrices(_ cell: CartTableCell)
}


class CartTableCell: UITableViewCell {

    @IBOutlet var orderPrice: UILabel!
    @IBOutlet var orderLabel: UILabel!
    @IBOutlet var cellView: UIView!
    @IBOutlet var orderImage: UIImageView!
    @IBOutlet var productDetail: UILabel!
    @IBOutlet var SteperLabel: UILabel!
    @IBOutlet var stepper: UIStepper!
    
    
    weak var delegate: CalculatePrice?
    
    
    var buyStat : BuyStat! {
        didSet {
            stepper.value = buyStat.purchaseAmount
            SteperLabel.text = String(buyStat.purchaseAmount)
        }
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        buyStat.purchaseAmount = sender.value
        self.SteperLabel.text = String(sender.value)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        stepper.wraps = true
         stepper.autorepeat = false
        
         stepper.maximumValue = 100
        stepper.minimumValue = 1
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    @IBAction func StepperAction(_ sender: UIStepper) {
//        delegate?.totalPrices(self)
//        SteperLabel.text = Int(sender.value).description
//
//
//    }
 
    
    
    

}
