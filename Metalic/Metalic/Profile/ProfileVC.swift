//
//  ProfileVC.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit
import FirebaseAuth
import FirebaseFirestore


class ProfileVC : UIViewController, UIImagePickerControllerDelegate {
    
    
    @IBOutlet var NameText: UILabel!
    @IBOutlet var EmailText: UILabel!
    var activityView: UIActivityIndicatorView?
    var imagePro : String?
    
    @IBOutlet var ProfileImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        UserApi.getUser(uid: Auth.auth().currentUser?.uid ?? "") { user in
            self.NameText.text = user.userFullName
            self.EmailText.text = user.userEmail
            self.imagePro = user.imageProfile
            self.savedImage()
            
        }
        
        ProfileImage.layer.cornerRadius = ProfileImage.frame.width / 2
       
    }
    @IBAction func Addimage(_ sender: Any) {
        
        showAlert()
    }
    
    @IBAction func LogInBottun(_ sender: Any) {
        
       let auth = Auth.auth()
        
        do{
            try auth.signOut()
            self.dismiss(animated: true, completion: nil)
            
        }catch{
            print(error.localizedDescription)
            
            
        }
        
        
        
    }
    func savedImage(){
        
        guard let url = URL(string: self.imagePro ?? "") else {return}
        if let data = try? Data(contentsOf: url) {
            
            self.ProfileImage.image = UIImage(data: data)
        }
        
    
        }
}

    
extension ProfileVC : UINavigationControllerDelegate {
        
        private func showAlert() {
            
            let alert = UIAlertController(title: "Image Selection", message: "From where you want to pick this image?", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
                self.getImage(fromSourceType: .camera)
            }))
            alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
                self.getImage(fromSourceType: .photoLibrary)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
        private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
            
            if UIImagePickerController.isSourceTypeAvailable(sourceType) {
                
                let imagePickerController = UIImagePickerController()
                imagePickerController.delegate = self
                imagePickerController.sourceType = sourceType
                self.present(imagePickerController, animated: true, completion: nil)
            }
        }
        
        //MARK:- UIImagePickerViewDelegate.
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            self.dismiss(animated: true) { [weak self] in
                
                guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
                
                self?.ProfileImage.image = image
                ImageProfileApi.uploadImageToFirebase(screenShot: image) { check, url in
                    if check{
                        UserApi.addImageProfile(uid: Auth.auth().currentUser?.uid ?? "", url: url ?? "")
                        
                    }
                }
            }
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
    }




    
    
    
    
    
    
    
    
    
    
    
    

