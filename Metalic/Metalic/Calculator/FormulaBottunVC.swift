//
//  FormulaBottunVC.swift
//  Metalic
//
//  Created by Anas Hamad on 09/05/1443 AH.
//

import UIKit

class FormulaBottunVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    

    @IBAction func gearModBottum(_ sender: Any) {
   
    performSegue(withIdentifier: "MOD", sender: nil)
    
    
    }
    
    
    @IBAction func gearSpBottun(_ sender: Any) {
    
    
    performSegue(withIdentifier: "Speed", sender: nil)
    
    
    }
    
    
    
    

}
