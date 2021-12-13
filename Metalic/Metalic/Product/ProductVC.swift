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
    
    var imageDetail = [product]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ProductApi.getImage { product in
            product.productImage
            product.productName
            
        }
 
    }

}



extension ProductVC : UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductListCellTableViewCell
        
        cell?.imageCell
        return
        
    }
    

    
    
    
    
    
    
    
    
    
    
    
}
