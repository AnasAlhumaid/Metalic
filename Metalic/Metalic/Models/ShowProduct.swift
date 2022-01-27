//
//  ShowProduct.swift
//  Metalic
//
//  Created by Anas Hamad on 23/06/1443 AH.
//

import Foundation


class ShowProduct {
    
    var name : String?
    var detail : String?
    var image : String?
    var price : String?
    
}
extension ShowProduct {
    
    static func getOrder(dect:[String:Any]) -> ShowProduct {
        let products = ShowProduct()
        products.name = dect["name"] as? String
        products.detail = dect["detail"] as? String
        products.image = dect["image"] as? String
        products.price = dect["price"] as? String
     
        
        return products
    }
}
