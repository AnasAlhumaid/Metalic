//
//  SheetsDraw.swift
//  Metalic
//
//  Created by Anas Hamad on 09/05/1443 AH.
//

import UIKit

class SheetsDraw: UIViewController {
    
    @IBOutlet var SheetCollection: UICollectionView!
    var product = [Product]()
    var sheets : Product?
    
    var selectedImage : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        
        SheetCollection.dataSource = self
        SheetCollection.delegate = self
        
        ProductApi.getProducts { product in
            DispatchQueue.main.async {
                self.product.append(product)
                self.SheetCollection.reloadData()
            }
        }
    }
    
    
    
    
}
extension SheetsDraw : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SheetCell", for: indexPath) as? ProductCollectionSheetCell else { return UICollectionViewCell()}
        guard let arrayOfSheet = product[indexPath.row].productImage else {return UICollectionViewCell()}
        
        guard let url = URL(string: arrayOfSheet) else {return UICollectionViewCell()}
        if let data = try? Data(contentsOf: url){
            cell.SheetImage.image = UIImage(data: data)
            
        }
        
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? EditDrawVC
        vc?.selectedImage = selectedImage
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title: "Choose", message: "", preferredStyle: .actionSheet)
        
        
        let drawing = UIAlertAction(title:"New", style: .default) { UIAlertAction in
            self.performSegue(withIdentifier: "NewDraw", sender: nil)
            
        }
            
            
            let addImage = UIAlertAction(title: "Edit", style: .default) { UIAlertActions in
                self.selectedImage = self.product[indexPath.row].productImage
                self.performSegue(withIdentifier: "EditDraw", sender: nil)
            }
        
        let addToCart = UIAlertAction(title: "Add to Cart ", style: .default) { UIAlertAction in
            <#code#>
        }
            
            alert.addAction(drawing)
            alert.addAction(addImage)
            present(alert, animated: true, completion: nil)
        
        
            }
    

 
    }
    
   
