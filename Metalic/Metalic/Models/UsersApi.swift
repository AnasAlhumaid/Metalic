//
//  UsersApi.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseFirestore



class UserApi {
    
    static func addUsers(uid:String,userEmail:String, userFullName : String, completion: @escaping (Bool) -> Void ){
        let db = Firestore.firestore()
        let refUsers = db.collection("Users")
        refUsers.document(uid).setData(Users.creatUsers(userFullName: userFullName, userEmail: userEmail, imageProfile: " "))
        
        completion(true)
    }
    static func addImageProfile (uid:String,url:String){
        
        
        let refusers = Firestore.firestore().collection("Users")
        refusers.document(uid).setData(Users.putImage(imageUrlProfile: url), merge: true)

        
    }
    
    
    static func getUser(uid:String,completion: @escaping(Users) -> Void){
        
        let db = Firestore.firestore()
        let refUsers = db.collection("Users")
        
        refUsers.document(uid).getDocument { decumant, error in
            if let decumant = decumant,decumant.exists{
                let user = Users.getUser(dect: decumant.data()!)
                
                completion(user)
                
   }
  }
 }
}
