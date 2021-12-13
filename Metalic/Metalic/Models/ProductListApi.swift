//
//  ProductListApi.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class ProductApi {
    
    
    static func getImage(completion: @escaping(product) -> Void){
        
        let db = Firestore.firestore()
        let refProduct = db.collection("Image")
        
        refProduct.getDocuments { documants, erorr in
            
            guard let decumants = documants?.documents else {return}
            for documant in decumants {
                refProduct.document(documant.documentID).getDocument { documant, error in
                    if let doc = documant, doc.exists{
                        let products = product.getImage(dect: doc.data()!)
                        completion(products)
                    }
                }
                
            }
        }
        
        
        
        
        
        
        
    }
    
}
