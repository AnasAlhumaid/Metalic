//
//  ProductDetail.swift
//  Metalic
//
//  Created by Anas Hamad on 24/05/1443 AH.
//

import Foundation
import UIKit
import Hero



class ProductDetails : UIViewController{
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var cardImage: UIImageView!
    
    @IBOutlet var titelLabel: UILabel!
    
    @IBOutlet var definitionLable: UILabel!
    
    @IBOutlet var moreInfo: UILabel!
    
    var arr  : ProductVC?
    var photolist : HeroModel?
    var selectedimage : String?
    var nameLabel : String?
    var DetailLabel : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image =  UIImage(named:selectedimage ?? "")
        titelLabel.text = nameLabel
        moreInfo.text = "You can choose from our Product and it ready for shipping".localized
        
        view.addSubview(backButton)
    }
    

    func ImageAnimat(){
        
        imageView.transform = CGAffineTransform(scaleX: 500, y: 500)
    
    }
    
    lazy var backButton: UIButton = {
           let button: UIButton = UIButton(frame: CGRect(x: 10, y: 50, width: 60, height: 30))
           button.addTarget(self, action: #selector(back(_:)), for: .touchUpInside)
        button.setTitle("Back".localized, for: .normal)
           return button
       }()

       @objc func back(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
       }
    
    
    
    @IBAction func ShowproBtn(_ sender: Any) {
        
        performSegue(withIdentifier: "Show", sender: self)
    }
    
    
    
    
    
    
    
}
