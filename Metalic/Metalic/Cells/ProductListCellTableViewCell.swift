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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func downloadImage(){
        ProductApi.getImage { product in
            let urlString = product.productImage
            guard let url = URL(string: urlString!) else {return}
            let data = URLSession.shared.dataTask(with: url) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }

                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.imageCell.image = image
                    
                }
                
            }
        }
        
        
        
        
        
    }

}
