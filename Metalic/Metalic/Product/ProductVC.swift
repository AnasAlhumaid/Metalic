//
//  ProductVC.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit
import Hero


class ProductVC : UIViewController {
    
    @IBOutlet var productListTableView: UITableView!
    
    var imageDetail = [Product]()
    let service = ["Machining Lathe","Machining Milling","Welding","hydraulic service","CNC"]
    
    var selectedImage : String?
    var selectedTitel : String?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        productListTableView.delegate = self
        productListTableView.dataSource = self
        hero.isEnabled = true
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProductDetails
        vc.selectedimage = selectedImage
        vc.nameLabel = selectedTitel
        
    }
    

}
extension ProductVC : UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        service.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductListCellTableViewCell
//        cell?.imageCell.image = UIImage(named: service[indexPath.row])
        cell?.imageCell.image = UIImage(named: service[indexPath.row])
//        cell?.imageCell.heroID = "imageCell"
        cell?.labelCell.text = service[indexPath.row]
        cell?.cellView.layer.shadowColor = UIColor.gray.cgColor
        cell?.cellView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cell?.cellView.layer.shadowOpacity = 2.0
        cell?.cellView.layer.masksToBounds = false
        cell?.cellView.layer.cornerRadius = 2.0
        cell?.cellView.layer.cornerRadius = 8.0
        cell?.imageCell.layer.cornerRadius = 8.0
        cell?.imageCell.heroID = "\(photo[indexPath.row])"
        
        
       
        
//
//        cell?.cellView.setRounded()
//        cell?.imageCell.setRoundedImg()
//        cell?.cellView.layer.shadowRadius = 2

        return cell ?? UITableViewCell()
    }
    
    

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedImage = service[indexPath.row]
        selectedTitel = service[indexPath.row]
//        let detail = ProductDetails()
//        detail.photolist = photo[indexPath.row]
//        present(detail, animated: true, completion: nil)
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! ProductDetails
        controller.selectedimage = selectedImage
        controller.nameLabel = selectedTitel
        controller.view.heroID = "\(photo[indexPath.row])"
        controller.showDetailViewController(controller, sender: nil)
                present(controller, animated: true, completion: nil)

//
//        performSegue(withIdentifier: "detail", sender: nil)

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

