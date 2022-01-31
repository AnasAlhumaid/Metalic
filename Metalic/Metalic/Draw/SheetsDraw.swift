//
//  SheetsDraw.swift
//  Metalic
//
//  Created by Anas Hamad on 09/05/1443 AH.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Kingfisher

class SheetsDraw: UIViewController {
    
    @IBOutlet var SheetCollection: UICollectionView!
    var product = [Product]()
    var sheets : Product?
    var orders = [Orders]()
    var activityView: UIActivityIndicatorView?
    
    
    var selectedImage : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SheetCollection.dataSource = self
        SheetCollection.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        product.removeAll()
        ProductApi.getProducts(uid:Auth.auth().currentUser?.uid ?? "" ) { product in
            DispatchQueue.main.async {
                self.product.append(product)
                self.SheetCollection.reloadData()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? EditDrawVC
        vc?.selectedImage = selectedImage
        
    }
    
    @IBAction func AddNewDraw(_ sender: Any) {
        ShowAlert()
    }
    
    func ShowAlert(){
        
        let alert = UIAlertController(title: "Choose".localized, message: "", preferredStyle: .actionSheet)
        // alert for creat new canves drawing
        let drawing = UIAlertAction(title:"New Project".localized, style: .default) { UIAlertAction in
            self.performSegue(withIdentifier: "NewDraw", sender: nil)
        }
        // alert for editing image
        let addImage = UIAlertAction(title: "Edit".localized, style: .default) { UIAlertActions in
            self.selectedImage = self.product[0].productImage
            self.performSegue(withIdentifier: "EditDraw", sender: nil)
        }
        let cancel = UIAlertAction(title: "Cancel".localized, style: .cancel)
        alert.addAction(drawing)
        alert.addAction(addImage)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}



extension SheetsDraw : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SheetCell", for: indexPath) as? ProductCollectionSheetCell else { return UICollectionViewCell()}
        // choose array for comverting image
        guard let arrayOfSheet = product[indexPath.row].productImage else {return UICollectionViewCell()}
        // convert array to url
        let url = URL(string: arrayOfSheet)
        // using KingFisher setting Image
        cell.SheetImage.kf.setImage(with: url, options: [.cacheOriginalImage])
        cell.nameLabe.text = product[indexPath.row].productName
        cell.sheetsView.layer.shadowColor = UIColor.gray.cgColor
        cell.sheetsView.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        cell.sheetsView.layer.shadowOpacity = 2.0
        cell.sheetsView.layer.masksToBounds = false
        cell.sheetsView.layer.cornerRadius = 2.0
        cell.sheetsView.layer.cornerRadius = 8.0
        cell.SheetImage.layer.cornerRadius = 8.0
        
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //creat alert when select item
        let alert = UIAlertController(title: "Choose".localized, message: "", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "cancel".localized, style: .cancel, handler: nil)
        // delete item from colliction
        let deletItem = UIAlertAction(title: "Delete".localized, style: .destructive) { action in
            if let selectedCells = collectionView.indexPathsForSelectedItems {
                //choose item
                let items = selectedCells.map { $0.item }.sorted().reversed()
                for item in items {
                    self.product.remove(at: item)
                }
                //delete from firbase
                collectionView.deleteItems(at: selectedCells)
            }
            
            ProductApi.deleteDocument(documentID: self.product[indexPath.row].id ?? "")
            
        }
        // for adding item to firebase
        let addToCart = UIAlertAction(title: "Add to Cart".localized, style: .default) { [self] UIAlertAction in
            let random = String(Int(arc4random()))
            CartApi.AddCart(random: random, cart: "", uid: Auth.auth().currentUser?.uid ?? "", productImage: product[indexPath.row].productImage ?? "", productName: product[indexPath.row].productName ?? "", productSize: "pinding", productNumber: "\(random)", productMaterial: "pinding" , productColor: "pinding" , productWight: 0.0 , productThreadSize: 0.0, productLength: 0.0, productHeadStyle: "" , productHeadDimeter: 0.0 , productHeadHeight: 0.0 , productThreadPich: 0.0 , productThreadType: "", productDriverSize: 0.0 , productStrength: 0.0 , productThreadLength: 0.0 , productPrice: 0.0 )
            
        }
        
        alert.addAction(cancel)
        alert.addAction(addToCart)
        alert.addAction(deletItem)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}





