//
//  OrderApi.swift
//  Metalic
//
//  Created by Anas Hamad on 11/05/1443 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import UIKit

class OrderApi {
    static func AddOrder(order:String,orderDate:String,detail:String){
    
    let refProduct = Firestore.firestore().collection("Order")
    
    refProduct.document().setData(Orders.creatOrder(order: order, orderDate: orderDate, detail: detail))
        
        
}

static func getOrder(com:@escaping (Orders) -> Void){
    
    let refProduct = Firestore.firestore().collection("Order")
    
    refProduct.getDocuments { documents, error in
        guard let documents = documents?.documents else {return}
        for document in documents {
            refProduct.document(document.documentID).getDocument { doc, error in
                let product = Orders.getOrder(dect: document.data())
                com(product)
            }
        }
    }
    
}
}
