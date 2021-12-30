//
//  CatrVC.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseAuth


class CartVC : UIViewController {
    
    
    @IBOutlet var totalPrice: UILabel!
    var cart = [Cart]()
    var selectedImage : String?
    
    @IBOutlet var cartTableView: UITableView!
    
    
    
    var selectedProducts : Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        CartApi.getCart(uid: Auth.auth().currentUser?.uid ?? "") { cart in
            
            self.cart.append(cart)
            
            self.cartTableView.reloadData()
            
        }
        
       
    }
    
    func sumproduct(){
        
        var counter: Double = 0.0
        for i in cart {
            counter += i.productPrice ?? 0.0
            
        }
        self.totalPrice.text = "\(counter)"
        
        
    }
    
    
}

//extension CartVC : CalculatePrice {
//    func totalPrice(_ cell: CartTableCell) {
//        
//        
//    }
//}

extension CartVC : UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cart.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Order", for: indexPath) as? CartTableCell else {return UITableViewCell()}
//
//
//        cell.orderImage.image = UIImage(named: selectedImage ?? "")
        guard let arrayOfCart = cart[indexPath.row].productImage else {return UITableViewCell()}
        guard let url = URL(string: arrayOfCart) else {return UITableViewCell()}
        DispatchQueue.main.async {
            if let data = try? Data(contentsOf: url){
                cell.orderImage.image = UIImage(data: data)
                cell.orderLabel.text = self.cart[indexPath.row].productName
                cell.orderPrice.text = String(self.cart[indexPath.row].productPrice ?? 0.0)
                cell.productDetail.text = self.cart[indexPath.row].productSize
                cell.cellView.layer.shadowColor = UIColor.gray.cgColor
                cell.cellView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
                cell.cellView.layer.shadowOpacity = 2.0
                cell.cellView.layer.masksToBounds = false
                cell.cellView.layer.cornerRadius = 12.0
                cell.orderImage.layer.cornerRadius = 8.0

            }
        }
        sumproduct()
        //cell.delegate = self
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        
            cart.remove(at: indexPath.row)
            cartTableView.deleteRows(at: [indexPath], with: .automatic)
            CartApi.deleteCart(uid: Auth.auth().currentUser?.uid ?? "")
            
    }
    
    
    
    
    
}
}

    

    
    
    
    
    
    
    
    
    

