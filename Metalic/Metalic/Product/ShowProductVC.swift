//
//  ShowProductVC.swift
//  Metalic
//
//  Created by Anas Hamad on 21/06/1443 AH.
//

import UIKit
import Firebase
import Kingfisher


protocol ItemCellDelegate {
    func itemCell(didTapButton button: UIButton)
}

class ShowProductVC: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var cncProduct : [ShowProduct] = []
    var latheProduct : [ShowProduct] = []
    var millProduct : [ShowProduct] = []
    var hydaulicProduct : [ShowProduct] = []
    var selectionArray = ["CNC".localized,"Lathe".localized,"Mill".localized,"Hydraulic".localized]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(backButton)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getproduct()
    }
    lazy var backButton: UIButton = {
           let button: UIButton = UIButton(frame: CGRect(x: 10, y: 50, width: 60, height: 30))
           button.addTarget(self, action: #selector(back(_:)), for: .touchUpInside)
        button.setTitle("Back".localized, for: .normal)
        button.backgroundColor = .systemBrown
        button.layer.cornerRadius = 12
           return button
       }()

       @objc func back(_ sender: UIButton) {
           dismiss(animated: true, completion: nil)
       }


    
    func getproduct(){
        
        let db = Firestore.firestore()
        db.collection("ShowProduct").document("CNC").getDocument { snapshott, error in
            
            guard let doc = snapshott else {return}
            for key in doc.data()!.keys {
                guard let data = doc.data()!["\(key)"] as? [String:Any] else {return}
                let products = ShowProduct.getOrder(dect: data)
                
                self.cncProduct.append(products)
            }
            self.tableView.reloadData()
            
        }
        db.collection("ShowProduct").document("Hydraulic").getDocument { snapshott, error in
            
            guard let doc = snapshott else {return}
            for key in doc.data()!.keys {
                guard let data = doc.data()!["\(key)"] as? [String:Any] else {return}
                let products = ShowProduct.getOrder(dect: data)
                self.hydaulicProduct.append(products)
            }
            self.tableView.reloadData()
            
        }
        db.collection("ShowProduct").document("Milling").getDocument { snapshott, error in
            
            guard let doc = snapshott else {return}
            for key in doc.data()!.keys {
                guard let data = doc.data()!["\(key)"] as? [String:Any] else {return}
                let products = ShowProduct.getOrder(dect: data)
                
                self.millProduct.append(products)
            }
            self.tableView.reloadData()
            
        }
        db.collection("ShowProduct").document("Lathe").getDocument { snapshott, error in
            
            guard let doc = snapshott else {return}
            for key in doc.data()!.keys {
                guard let data = doc.data()!["\(key)"] as? [String:Any] else {return}
                let products = ShowProduct.getOrder(dect: data)
                
                self.latheProduct.append(products)
                print(products)
            }
            self.tableView.reloadData()
            
        }
    }

}


extension Cart: ItemCellDelegate {
    func itemCell(didTapButton button: UIButton) {
        
    }
}


extension ShowProductVC : UITableViewDelegate,UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        selectionArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0 :
            return "CNC".localized
        case 1 :
            return "Lathe".localized
        case 2 :
            return "Mill".localized
        case 3 :
            return "Hydraulic".localized
        default:
            return ""
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0 :
            return cncProduct.count
        case 1 :
            return latheProduct.count
        case 2 :
            return millProduct.count
        case 3 :
            return hydaulicProduct.count
        default:
            return 5
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionName = selectionArray[indexPath.section]
        
        
        
        
        switch sectionName {
        case "CNC".localized:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShowProductCell
            guard let cncarryOfCart = cncProduct[indexPath.row].image else {return UITableViewCell()}
            let cncUrl = URL(string: cncarryOfCart)
            
            let cnc = self.cncProduct[indexPath.row]
            cell.nameProductLabel?.text = cnc.name
            cell.priceLabel.text = "\(cnc.price ?? "")$"
            cell.productInfo.text = cnc.detail
            cell.cellImageView.kf.setImage(with: cncUrl, options: [.cacheOriginalImage])
            cell.cellView.layer.shadowColor = UIColor.gray.cgColor
            cell.cellView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.cellView.layer.shadowOpacity = 2.0
            cell.cellView.layer.masksToBounds = false
            cell.cellView.layer.cornerRadius = 12.0
            return cell
        case "Lathe".localized:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShowProductCell
            guard let lathearryOfCart = latheProduct[indexPath.row].image else {return UITableViewCell()}
            let latheUrl = URL(string: lathearryOfCart)
            let lathe = self.latheProduct[indexPath.row]
            cell.nameProductLabel?.text = lathe.name
            cell.priceLabel.text = "\(lathe.price ?? "")$"
            cell.productInfo.text = lathe.detail
            cell.cellImageView.kf.setImage(with: latheUrl, options: [.cacheOriginalImage])
            cell.backgroundColor = UIColor.white
            cell.cellView.layer.shadowColor = UIColor.gray.cgColor
            cell.cellView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.cellView.layer.shadowOpacity = 2.0
            cell.cellView.layer.masksToBounds = false
            cell.cellView.layer.cornerRadius = 12.0
            return cell
        case "Mill".localized:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShowProductCell
            guard let millarryOfCart = millProduct[indexPath.row].image else {return UITableViewCell()}
            
            let millUrl = URL(string: millarryOfCart)
            let milling = self.millProduct[indexPath.row]
            cell.nameProductLabel?.text = milling.name
            cell.priceLabel.text =  "\(milling.price ?? "")$"
            cell.productInfo.text = milling.detail
            cell.cellImageView.kf.setImage(with: millUrl, options: [.cacheOriginalImage])
            cell.backgroundColor = UIColor.white
            
            cell.cellView.layer.shadowColor = UIColor.gray.cgColor
            cell.cellView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.cellView.layer.shadowOpacity = 2.0
            cell.cellView.layer.masksToBounds = false
            cell.cellView.layer.cornerRadius = 12.0
            return cell
        case "Hydraulic".localized:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ShowProductCell
            guard let hydraulicarryOfCart = hydaulicProduct[indexPath.row].image else {return UITableViewCell()}
            let hydraulicUrl = URL(string: hydraulicarryOfCart)
            let hydrau = self.hydaulicProduct[indexPath.row]
            cell.nameProductLabel?.text = hydrau.name
            cell.priceLabel.text = "\(hydrau.price ?? "")$"
            cell.productInfo.text = hydrau.detail
            cell.cellImageView.kf.setImage(with: hydraulicUrl, options: [.cacheOriginalImage])
            cell.backgroundColor = UIColor.white
            cell.cellView.layer.shadowColor = UIColor.gray.cgColor
            cell.cellView.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
            cell.cellView.layer.shadowOpacity = 2.0
            cell.cellView.layer.masksToBounds = false
            cell.cellView.layer.cornerRadius = 12.0
            return cell
        default:
            return UITableViewCell()
        }
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    
 
}




















