//
//  Registorations.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class Registrations :UIViewController{
    
    @IBOutlet var userNametxtR: UITextField!
    @IBOutlet var fullNametxtR: UITextField!
    @IBOutlet var passWordR: UITextField!
    @IBOutlet var rePasswordTextR: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func checkText(){
        
        if userNametxtR.text?.isEmpty == true || fullNametxtR.text?.isEmpty == true || passWordR.text?.isEmpty == true || rePasswordTextR.text?.isEmpty == true{
            
            desplayAlert(Title: "Wrong", Massage: "There is text Empity")
        }
        
        if passWordR.text != rePasswordTextR.text {
            
            desplayAlert(Title: "Wrong", Massage: "The password not Match")
        }
    }
    
    @IBAction func registorationsButton(_ sender: Any) {
        
        checkText()
        Auth.auth().createUser(withEmail: userNametxtR.text ?? "", password: passWordR.text ?? "") { user, error in
            if let error = error {
                print("errorIs:\(error)")
                self.desplayAlert(Title: "Error", Massage: error.localizedDescription)
            } else {
                
                UserApi.addUsers(uid: user?.user.uid ?? "", userEmail: self.userNametxtR.text ?? "" , userFullName: self.fullNametxtR.text ?? "") { result in
                    if result {
                        print("Done saving")
                        
                    }
                }
                
                
                
                self.desplayAlert(Title: "Sucsses", Massage: "You Are registered now")
            }
        }
        
        
        
    }
    
    
    
    func desplayAlert(Title:String,Massage:String){
        
        let alert = UIAlertController(title: Title, message: Massage, preferredStyle:.alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
    
    
}
