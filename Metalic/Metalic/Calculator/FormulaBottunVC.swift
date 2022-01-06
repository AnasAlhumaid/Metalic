//
//  FormulaBottunVC.swift
//  Metalic
//
//  Created by Anas Hamad on 09/05/1443 AH.
//

import UIKit

class FormulaBottunVC: UIViewController {

    @IBOutlet var speedOut: UIButton!
    @IBOutlet var modOut: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        speedOut.backgroundColor = .white
        speedOut.layer.cornerRadius = 12
        speedOut.layer.borderWidth = 3
        speedOut.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        modOut.backgroundColor = .white
        modOut.layer.cornerRadius = 12
        modOut.layer.borderWidth = 3
        modOut.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        
        
    }
    

    @IBAction func gearModBottum(_ sender: Any) {
        
    performSegue(withIdentifier: "MOD", sender: nil)
    
    
    }
    
    
    @IBAction func gearSpBottun(_ sender: Any) {
    
    
    performSegue(withIdentifier: "Speed", sender: nil)
    
    
    }
    
    
    
    

}
