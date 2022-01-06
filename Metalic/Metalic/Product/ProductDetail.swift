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
    
    var arr  : ProductVC?
    
    var photolist : HeroModel?
    
    var selectedimage : String?
    var nameLabel : String?
    var DetailLabel : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image =  UIImage(named:selectedimage ?? "")
        titelLabel.text = nameLabel
        
        view.addSubview(backButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
//        guard let photo = photolist?.PhotoImage else {return}
//        imageView.image = UIImage(named: photo)
//        imageView.heroID = photolist?.PhotoID
//        imageView.image = UIImage(named: selectedimage ?? "" )
//        imageView.heroID = "image"
//
//        whiteView.hero.modifiers = [.translate(y:100)]
        
//        imageView.image = UIImage(named: selectedimage ?? "")
    }
    func ImageAnimat(){
        
        imageView.transform = CGAffineTransform(scaleX: 500, y: 500)
    
        
        
    }
    
    func zoomIn() {
     
    }
    
    lazy var backButton: UIButton = {
           let button: UIButton = UIButton(frame: CGRect(x: 10, y: 30, width: 60, height: 30))
           button.addTarget(self, action: #selector(back(_:)), for: .touchUpInside)
           button.setTitle("Back", for: .normal)
           return button
       }()

       @objc func back(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
       }
    
    
    
    
    
    
    
    
    
    
}
