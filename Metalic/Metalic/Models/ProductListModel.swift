//
//  ProductListModel.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit

//
//struct ProductDetail {
//
//    var productName :[String]
//    var productPrice : [Int]
//    var productImage : [String]
//}
//

class Product {
    var productImage : String?
    var productName : String?
}

extension Product {
    
    static func getProduct(dect:[String:Any]) -> Product {
        let products = Product()
        products.productImage = dect["productImage"] as? String
        products.productName = dect["productName"] as? String
        
        
        return products
    }
    static func creatProduct(productImage : String, productName : String ) -> [String:Any] {
        
        let newProduct = ["productName": productName, "productImage": productImage] as [String:Any]
        return newProduct
        
    }
    
    
}

