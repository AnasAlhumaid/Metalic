//
//  CartApi.swift
//  Metalic
//
//  Created by Anas Hamad on 21/05/1443 AH.
//

import Foundation
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore


class CartApi {
    
    static func AddCart(random:String,cart:String,uid:String,productImage: String, productName: String, productSize: String?, productNumber: Int, productMaterial: String?, productColor: String?, productWight: Double?, productThreadSize: Double?, productLength: Double?, productHeadStyle: String?, productHeadDimeter: Double?, productHeadHeight: Double?, productThreadPich: Double?, productThreadType: String?, productDriverSize: Double?, productStrength: Double?, productThreadLength: Double?, productPrice: Double? ){
        
        let refProduct = Firestore.firestore().collection("Cart")
        
        let product = Cart.creatCart(productImage: productImage, productName: productName, productSize: productSize ?? "", productNumber: productNumber, productMaterial: productMaterial ?? "", productColor: productColor ?? "", productWight: productWight ?? 0.0, productThreadSize: productThreadSize ?? 0.0, productLength: productLength ?? 0.0, productHeadStyle: productHeadStyle ?? "", productHeadDimeter: productHeadDimeter ?? 0.0, productHeadHeight: productHeadHeight ?? 0.0, productThreadPich: productThreadPich ?? 0.0, productThreadType: productThreadType ?? "", productDriverSize: productDriverSize ?? 0.0, productStrength: productStrength ?? 0.0, productThreadLength: productThreadLength ?? 0.0, productPrice: productPrice ?? 0.0 )
        
        refProduct.document(uid).setData([random :product],merge: true)
    }
    
    static func getCart(uid:String,com:@escaping (Cart) -> Void){
        
        let refProduct = Firestore.firestore().collection("Cart")
        
        refProduct.document(uid).getDocument { doc, error in
         
            guard let doc = doc else {return}
            for key in doc.data()!.keys {
                guard let data = doc.data()!["\(key)"] as? [String:Any] else {return}
                let products = Cart.getCart(dect: data)
                
                com(products)
            }
            
            
        }
        
        
    }
    
    static func deleteCart(uid:String){
        
       let db = Firestore.firestore()
        db.collection("Cart").document(uid).updateData([
            "capital": FieldValue.delete(),
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        
        
        
        
    }
    
    
}
