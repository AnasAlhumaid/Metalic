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
    
    
    static func AddDrawProduct(uid:String,productImage:String,productName:String){
        
        let refProduct = Firestore.firestore().collection("Product")
        let id = arc4random().description
        let product = Product.creatDrawProduct(productImage: productImage, productName: productName, id: id)
        refProduct.document(uid).setData([id : product], merge: true)
        
    }
    
    static func AddProduct(productImage:String,productName:String, productSize: String, productNumber: Int, productMaterial: String, productColor: String, productWight: Double, productThreadSize: Double, productLength: Double, productHeadStyle: String, productHeadDimeter: Double, productHeadHeight: Double, productThreadPich: Double, productThreadType: String, productDriverSize: Double, productStrength: Double, productThreadLength: Double, productPrice:Double,uid:String){
        
        let refProduct = Firestore.firestore().collection("Product")
        
        refProduct.document().setData(Product.creatProduct(productImage: productImage, productName: productName, productSize: productSize, productNumber: productNumber, productMaterial: productMaterial, productColor: productColor, productWight: productWight, productThreadSize: productThreadSize, productLength: productLength, productHeadStyle: productHeadStyle, productHeadDimeter: productHeadDimeter, productHeadHeight: productHeadHeight, productThreadPich: productThreadPich, productThreadType: productThreadType, productDriverSize: productDriverSize, productStrength: productStrength, productThreadLength: productThreadLength, productPrice: productPrice,uid:uid ))
        
    }
    
    static func getProducts(uid : String , com:@escaping (Product) -> Void){
        
        let refProduct = Firestore.firestore().collection("Product")
        refProduct.document(uid).getDocument { doc, error in
        guard let doc = doc else {return}
            guard let docm = doc.data()?.keys else {return}
        for key in docm {
            guard let data = doc.data()!["\(key)"] as? [String:Any] else {return}
            let products = Product.getProduct(dect: data)
            
            com(products)
            }
        }
    }
    
    
    static func deleteDocument(documentID:String){
        
        Firestore.firestore().collection("Product").document(documentID).delete()
            
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
