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
        
        
//        cell?.cellView.layer.cornerRadius = cell?.cellView.frame.height

        return cell ?? UITableViewCell()
    }
    

}
