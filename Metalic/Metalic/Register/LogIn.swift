//
//  LogIn.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth


class LogIn : UIViewController{
    
    @IBOutlet var userNameText: UITextField!
    
    @IBOutlet var passWordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
       if Auth.auth().currentUser != nil {
           self.performSegue(withIdentifier: "HomePage", sender: nil)
          
       }
    }
    
    func checkText(){
        
        if userNameText.text?.isEmpty == true || passWordText.text?.isEmpty == true {
            
            desplayAlert(Title: "Wrong", Massage: "The Username or Passwod is Empity")
        }
        
    }
    
 
    
    @IBAction func loginButton(_ sender: Any) {
        
        checkText()
        
        Auth.auth().signIn(withEmail: userNameText.text ?? "", password: passWordText.text ?? "") { Auth, error in
            
            if let error = error {
                print("The error is : \(error)")
                self.desplayAlert(Title: "Wrong", Massage: error.localizedDescription)
            }else{
                self.performSegue(withIdentifier: "HomePage", sender: nil)
            }
        }
        
    }
    
   
    
    
    @IBAction func registerButton(_ sender: Any) {
        
        performSegue(withIdentifier: "Register", sender: nil)
        
    }
    
    
    func desplayAlert(Title:String,Massage:String){
        
        let alert = UIAlertController(title: Title, message: Massage, preferredStyle:.alert)
        
        let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(ok)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
}
