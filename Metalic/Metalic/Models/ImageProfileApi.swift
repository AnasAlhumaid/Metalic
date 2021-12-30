//
//  ImageProfileApi.swift
//  Metalic
//
//  Created by Anas Hamad on 19/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseStorage
import FirebaseAuth
import FirebaseFirestore
 

class ImageProfileApi {

        

    

     static func uploadImageToFirebase(screenShot:UIImage,completion: @escaping (Bool,String?) -> Void){
        
        
        let storageReference = Storage.storage().reference()
        let profileImageRef = storageReference.child("Users").child(Auth.auth().currentUser?.uid ?? "").child("\(String(Int(arc4random()))).jpg")
        
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



