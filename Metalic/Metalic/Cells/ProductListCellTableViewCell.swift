//
//  ProductListCellTableViewCell.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import UIKit
import Hero

class ProductListCellTableViewCell: UITableViewCell {

    @IBOutlet var cellView: UIView!
    @IBOutlet var imageCell: UIImageView!
    @IBOutlet var labelCell: UILabel!
    var imageselected : UIImage?
    
    
    let service = ["Machining Lathe","Machining Milling","Welding","hydraulic service","CNC"]
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCell.hero.id = "imageCell"
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}


