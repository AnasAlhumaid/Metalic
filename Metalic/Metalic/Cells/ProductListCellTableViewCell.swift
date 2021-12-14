//
//  ProductListCellTableViewCell.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import UIKit

class ProductListCellTableViewCell: UITableViewCell {

    @IBOutlet var cellView: UIView!
    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var labelCell: UILabel!
    
    
    let service = ["Machining Lathe","Machining Milling","Welding","hydraulic service","CNC"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}


