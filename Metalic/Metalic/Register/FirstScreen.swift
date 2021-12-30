//
//  FirstScreen.swift
//  Metalic
//
//  Created by Anas Hamad on 22/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseAuth


class FirstScreen : UIViewController{
    
    
    override func viewDidAppear(_ animated: Bool) {
       if Auth.auth().currentUser != nil {
           self.performSegue(withIdentifier: "HomePage", sender: nil)
          
       }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    
    @IBAction func LoginButton(_ sender: Any) {
        performSegue(withIdentifier: "LogIn", sender: nil)
        
    }
    
    @IBAction func signupButton(_ sender: Any) {
        performSegue(withIdentifier: "SignUp", sender: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
