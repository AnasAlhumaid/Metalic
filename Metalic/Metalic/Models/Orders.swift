//
//  Order.swift
//  Metalic
//
//  Created by Anas Hamad on 11/05/1443 AH.
//

import Foundation
import UIKit

class Orders {
    var products : [Product]?
    var orderDate : Date?
    var detail : String?
    
    
}

extension Orders {
    
    static func getOrder(dect:[String:Any]) -> Orders {
        let products = Orders()
        products.products = dect["products"] as? [Product]
        products.orderDate = dect["orderDate"] as? Date
        products.detail = dect["detail"] as? String
        
        
        return products
    }
    static func creatOrder(products : String, orderDate : String, detail : String ) -> [String:Any] {
        
        let newOrder = ["products": products, "orderDate": orderDate, "detail": detail ] as [String:Any]
        
        return newOrder
        
    }
    
    
}
