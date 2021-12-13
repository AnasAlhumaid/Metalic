//
//  ProfileVC.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore


class ProfileVC : UIViewController{
    
    
    @IBOutlet var NameText: UILabel!
    @IBOutlet var EmailText: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            self.NameText.text = user.userFullName
            self.EmailText.text = user.userEmail
        }
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
