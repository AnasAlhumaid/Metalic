//
//  CatrVC.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseAuth
import Kingfisher



class CartVC : UIViewController {
    
    var cart = [Cart]()
    var selectedImage : String?
    var selectedProducts : Product?
    @IBOutlet var checkOutBottunOut: UIButton!
    @IBOutlet var cartTableView: UITableView!
    @IBOutlet var totalPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        
        checkOutBottunOut.backgroundColor = UIColor(red: 0.186, green: 0.170, blue: 0.128, alpha: 1)
        checkOutBottunOut.layer.cornerRadius = 12
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cart.removeAll()
        CartApi.getCart(uid: Auth.auth().currentUser?.uid ?? "") { cart in
            
            self.cart.append(cart)
            self.cartTableView.reloadData()
        }
    }
    
    func sumProduct(){
        
        var counter: Double = 0.0
        for i in cart {
            counter += i.productPrice ?? 0.0
        }
        self.totalPrice.text = "\(counter)"
    }
}



extension CartVC : CalculatePrice {
    func totalPrices(_ cell: CartTableCell) {
        
        guard let num = Double(cell.SteperLabel.text ?? "-") else {return}
        guard let num2 = Double(cell.orderPrice.text ?? "-") else {return}
        print("cell.stepper.isContinuous :\(cell.stepper.isContinuous)")
        cell.orderPrice.text = "\(num * num2)"
        
        totalPrice.text = "\(num * num2)"
        self.cartTableView.reloadData()
        
    }
}

extension CartVC : UITableViewDataSource,UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cart.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Order", for: indexPath) as? CartTableCell else {return UITableViewCell()}
        guard let arrayOfCart = cart[indexPath.row].productImage else {return UITableViewCell()}
        
        DispatchQueue.main.async {
            
            let url = URL(string: arrayOfCart)
            cell.orderImage.kf.setImage(with: url,options: [.cacheOriginalImage])
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
        
        sumProduct()
        cell.delegate = self
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            CartApi.deleteCart(uid: Auth.auth().currentUser?.uid ?? "", ProductNumber:cart[indexPath.row].productNumber ?? "" )
            cart.remove(at: indexPath.row)
            cartTableView.deleteRows(at: [indexPath], with: .automatic)
            
            tableView.reloadData()
            
            
        }
        
        
    }
    
    
    
    
    
}














