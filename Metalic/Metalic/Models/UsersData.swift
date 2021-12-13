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
}
extension Users{
    
    static func getUser(dect:[String: Any ]) -> Users{
        let users = Users()
        users.userEmail = dect["userEmail"] as? String
        users.userFullName = dect["userFullName"] as? String
        
        return users
        
    }
    
    static func creatUsers(userFullName : String, userEmail : String ) -> [String:Any]{
        let newUser =
        ["userFullName": userFullName,
        "userEmail": userEmail] as [String:Any]
        return newUser
        
        
    }
    
    }
    
    
    
    

