//
//  CatrVC.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit


class CartVC : UIViewController {
    
    @IBOutlet var cartTableView: UITableView!
    
    var orders = [Orders]()
    
    var selectedProducts:[Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        OrderApi.getOrder { order in
            DispatchQueue.main.async {
                self.orders.append(order)
                self.cartTableView.reloadData()
               
            }
        }
        
        
        
    }
    
    
    
    
    
    
    
    
}

extension CartVC : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let selectedOrder = orders[indexPath.row].products else {return }
//        selectedProducts = selectedOrder.products
//    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Order", for: indexPath) as? CartTableCell else {return UITableViewCell()}
        
        guard let arrayOfSheet = orders[indexPath.row].products  else {return UITableViewCell()}
        guard let url = URL(string: arrayOfSheet) else {return UITableViewCell()}
        if let data = try? Data(contentsOf: url){
            cell.orderImage.image = UIImage(data: data)
            cell.orderLabel.text = orders[indexPath.row].products
            cell.orderPrice.text = orders[indexPath.row].detail
            
    }
        return cell
    }

    
}
    
    
    
    
    
    
    
    
    

