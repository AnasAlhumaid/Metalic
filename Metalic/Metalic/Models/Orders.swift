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
    var orderNumber: Int?
    var orderAddress : String?
    var orderPhoneNumber : String?
    var orderCompanyName : String?
    var orderZipCode : Int?
    var orderCity : String?
    var orderState : Bool?
    var orderDelevaryMethods : String?
    
}

extension Orders {
    
    static func getOrder(dect:[String:Any]) -> Orders {
        let products = Orders()
        products.products = dect["products"] as? [Product]
        products.orderDate = dect["orderDate"] as? Date
        products.orderNumber = dect["orderNumber"] as? Int
        products.orderAddress = dect["orderAddress"] as? String
        products.orderPhoneNumber = dect["orderPhoneNumber"] as? String
        products.orderCompanyName = dect["orderCompanyName"] as? String
        products.orderZipCode = dect["orderZipCode"] as? Int
        products.orderCity = dect["orderCity"] as? String
        products.orderState = dect["orderState"] as? Bool
        products.orderDelevaryMethods = dect["orderDelevaryMethods"] as? String

        
        return products
    }
    static func creatOrder(products : String, orderDate : String, detail : String ) -> [String:Any] {
        
        let newOrder = ["products": products, "orderDate": orderDate, "detail": detail ] as [String:Any]
        
        return newOrder
        
    }
    
    
}

