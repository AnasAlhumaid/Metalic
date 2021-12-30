//
//  UsersData.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation



class Users{
    var userFullName : String?
    var userEmail : String?
    var imageProfile : String?
}
extension Users{
    
    static func getUser(dect:[String: Any ]) -> Users{
        let users = Users()
        users.userEmail = dect["userEmail"] as? String
        users.userFullName = dect["userFullName"] as? String
        users.imageProfile = dect["imageProfile"] as? String
        
        return users
        
    }
    
    static func creatUsers(userFullName : String, userEmail : String , imageProfile: String ) -> [String:Any]{
        let newUser =
        ["userFullName": userFullName,
        "userEmail": userEmail
         ,"imageProfile": imageProfile ] as [String:Any]
        return newUser
        
        
    }
    static func putImage(imageUrlProfile: String ) -> [String:Any]{
        let newImage =
        ["imageProfile": imageUrlProfile ] as [String:Any]
        return newImage
    }
    
    
    }
    
    
    
    

