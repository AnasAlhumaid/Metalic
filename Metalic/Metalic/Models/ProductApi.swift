//
//  ProductListApi.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage
import UIKit

class ProductApi {
    
    
    static func AddDrawProduct(productImage:String,productName:String){
        
        let refProduct = Firestore.firestore().collection("Product")
        
        refProduct.document().setData(Product.creatDrawProduct(productImage: productImage, productName: productName))
        
    }
    
    static func AddProduct(productImage:String,productName:String, productSize: String, productNumber: Int, productMaterial: String, productColor: String, productWight: Double, productThreadSize: Double, productLength: Double, productHeadStyle: String, productHeadDimeter: Double, productHeadHeight: Double, productThreadPich: Double, productThreadType: String, productDriverSize: Double, productStrength: Double, productThreadLength: Double, productPrice:Double){
        
        let refProduct = Firestore.firestore().collection("Product")
        
        refProduct.document().setData(Product.creatProduct(productImage: productImage, productName: productName, productSize: productSize, productNumber: productNumber, productMaterial: productMaterial, productColor: productColor, productWight: productWight, productThreadSize: productThreadSize, productLength: productLength, productHeadStyle: productHeadStyle, productHeadDimeter: productHeadDimeter, productHeadHeight: productHeadHeight, productThreadPich: productThreadPich, productThreadType: productThreadType, productDriverSize: productDriverSize, productStrength: productStrength, productThreadLength: productThreadLength, productPrice: productPrice ))
        
    }
    
    static func getProducts(com:@escaping (Product) -> Void){
        
        let refProduct = Firestore.firestore().collection("Product")
        
        refProduct.getDocuments { documents, error in
            guard let documents = documents?.documents else {return}
            for document in documents {
                refProduct.document(document.documentID).getDocument { doc, error in
                    let product = Product.getProduct(dect: document.data())
                    com(product)
                }
            }
        }
    }
    
    static func uploadImageToFirebase(screenShot:UIImage,nameText:String ,completion: @escaping (Bool,String?) -> Void){
        
        
        let storageReference = Storage.storage().reference()
        let profileImageRef = storageReference.child("Products").child(Auth.auth().currentUser?.uid ?? "").child("\(String(Int(arc4random()))).jpg")
        
        let uploadMetaData = StorageMetadata()
        uploadMetaData.contentType = "image/jpeg"
        
        
        guard let data = screenShot.pngData() else {return}
        
        profileImageRef.putData(data, metadata: uploadMetaData) { (uploadedImageMeta, error) in
            
            if error != nil {
                print("Error took place \(String(describing: error?.localizedDescription))")
                completion(false,nil)
            } else {
                profileImageRef.downloadURL(completion: { (url, error) in
                    // save url string
                    let urlDownload = url?.absoluteString
                    completion(true,urlDownload)
                })
                print("Meta data of uploaded image \(String(describing: uploadedImageMeta))")
            }
        }
        
    }
}