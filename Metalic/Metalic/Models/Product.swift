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
    var productPrice : Double?
    var productSize : String?
    var productNumber : Int?
    var productMaterial : String?
    var productColor : String?
    var productWight : Double?
    var productThreadSize : Double?
    var productLength : Double?
    var productHeadStyle : String?
    var productHeadDimeter : Double?
    var productHeadHeight : Double?
    var productThreadPich : Double?
    var productThreadType : String?
    var productDriverSize : Double?
    var productStrength : Double?
    var productThreadLength : Double?
    var id: String?

}

extension Product {
    
    static func getProduct(dect:[String:Any]) -> Product {
        let products = Product()
        products.productImage = dect["productImage"] as? String
        products.productPrice = dect["productPrice"] as? Double
        products.productName = dect["productName"] as? String
        products.productSize = dect["productSize"] as? String
        products.productNumber = dect["productNumber"] as? Int
        products.productMaterial = dect["productMaterial"] as? String
        products.productColor = dect["productColor"] as? String
        products.productWight = dect["productWight"] as? Double
        products.productThreadSize = dect["productThreadSize"] as? Double
        products.productLength = dect["productLength"] as? Double
        products.productHeadStyle = dect["productHeadStyle"] as? String
        products.productHeadDimeter = dect["productHeadDimeter"] as? Double
        products.productHeadHeight = dect["productHeadHeight"] as? Double
        products.productThreadPich = dect["productThreadPich"] as? Double
        products.productThreadType = dect["productThreadType"] as? String
        products.productDriverSize = dect["productDriverSize"] as? Double
        products.productStrength = dect["productStrength"] as? Double
        products.productThreadLength = dect["productThreadLength"] as? Double
        products.id = dect["id"] as? String
        
        return products
    }
  
    //
    static func creatDrawProduct(productImage : String, productName : String, id :String ) -> [String:Any] {
        
        let newDrawProduct = ["productName": productName, "productImage": productImage,"uid":id] as [String:Any]
        return newDrawProduct
        
    }
    
    static func creatProduct(productImage:String,productName:String,productSize:String,productNumber:Int,productMaterial:String,productColor:String,productWight:Double,productThreadSize:Double,productLength:Double,productHeadStyle:String,productHeadDimeter:Double,productHeadHeight:Double,productThreadPich:Double,productThreadType:String,productDriverSize:Double,productStrength:Double,productThreadLength:Double, productPrice : Double,uid:String) -> [String:Any] {
        
        let newProduct = ["productImage":productImage,"productName":productName,"productSize":productSize, "productNumber":productNumber,"productMaterial":productMaterial,"productColor":productColor,"productWight":productWight,"productThreadSize":productThreadSize,"productLength":productLength,"productHeadStyle":productHeadStyle,"productHeadDimeter":productHeadDimeter,"productHeadHeight":productHeadHeight,"productThreadPich":productThreadPich,"productThreadType":productThreadType,"productDriverSize":productDriverSize,"productStrength":productStrength,"productThreadLength":productThreadLength,"productPrice":productPrice
                          ,"uid":uid] as [String:Any]
        
        return newProduct
        

        
    }
    
    
    
    
    
    
    
}

