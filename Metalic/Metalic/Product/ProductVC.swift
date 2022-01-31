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
    
    let service = ["Machining Lathe".localized,"Machining Milling".localized,"Welding".localized,"hydraulic service".localized,"CNC".localized]
    let imageService = ["1","2","3","4","5"]
    var imageDetail = [Product]()
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
        
        cell?.imageCell.image = UIImage(named: imageService[indexPath.row])
        cell?.labelCell.text = service[indexPath.row]
        cell?.cellView.layer.shadowColor = UIColor.gray.cgColor
        cell?.cellView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cell?.cellView.layer.shadowOpacity = 2.0
        cell?.cellView.layer.masksToBounds = false
        cell?.cellView.layer.cornerRadius = 2.0
        cell?.cellView.layer.cornerRadius = 8.0
        cell?.imageCell.layer.cornerRadius = 8.0
        cell?.imageCell.heroID = "\(photo[indexPath.row])"
        
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedImage = imageService[indexPath.row]
        selectedTitel = service[indexPath.row]
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detail") as! ProductDetails
        controller.selectedimage = selectedImage
        controller.nameLabel = selectedTitel
        controller.view.heroID = "\(photo[indexPath.row])"
        controller.modalPresentationStyle = .fullScreen
        controller.showDetailViewController(controller, sender: nil)
        present(controller, animated: true, completion: nil)
        
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

