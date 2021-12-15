//
//  ProductVC.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit


class ProductVC : UIViewController {
    
    @IBOutlet var productListTableView: UITableView!
    
    var imageDetail = [Product]()
    let service = ["Machining Lathe","Machining Milling","Welding","hydraulic service","CNC"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productListTableView.delegate = self
        productListTableView.dataSource = self
    }

}
extension ProductVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        service.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductListCellTableViewCell
        cell?.imageCell.image = UIImage(named: service[indexPath.row])
        cell?.labelCell.text = service[indexPath.row]
        
        cell?.cellView.setRounded()
        cell?.imageCell.setRoundedImg()

        return cell ?? UITableViewCell()
    }
    

}
extension UIImageView {
    func setRoundedImg() {
        layer.cornerRadius = bounds.height/2
        layer.masksToBounds = true
    }
}
extension UIView {
    func setRounded() {
        layer.cornerRadius = bounds.height/2
        layer.masksToBounds = true
    }
}
