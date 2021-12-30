//
//  EditDrawVC.swift
//  Metalic
//
//  Created by Anas Hamad on 10/05/1443 AH.
//
import Foundation
import UIKit
import PencilKit

class EditDrawVC: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {

    @IBOutlet var Save: UIBarButtonItem!
    @IBOutlet var canvasView : PKCanvasView!
    @IBOutlet var imageView: UIImageView!
    
    var product = Product()
    var drawing = PKDrawing()
    var toolPicker: PKToolPicker!
    let picker = UIImagePickerController()
    var imgForMarkup: UIImage?
    var activityView: UIActivityIndicatorView?
    
    var selectedImage : String?
    var setSelectedImage : String?
    
    fileprivate func delegateCanv() {
 
        canvasView.delegate = self
        
        canvasView.drawing = drawing
        
        canvasView.alwaysBounceVertical = true
        
        canvasView.allowsFingerDrawing = true
        
        if #available(iOS 14.0, *) {
            
            toolPicker = PKToolPicker()
        } else {
            // Set up the tool picker, using the window of our parent because our view has not
            // been added to a window yet.
            let window = parent?.view.window
            toolPicker = PKToolPicker.shared(for: window!)
        }
        
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        toolPicker.addObserver(self)
        canvasView.becomeFirstResponder()
    }
    func showActivityIndicatory() {
            let container: UIView = UIView()
            container.frame = CGRect(x: 0, y: 0, width: 80, height: 80) // Set X and Y whatever you want
            container.backgroundColor = .clear
    
            if #available(iOS 13.0, *) {
                activityView = UIActivityIndicatorView(style: .large)
            } else {
                activityView = UIActivityIndicatorView(style: .whiteLarge)
            }
            activityView?.color = .label
            //activityView?.center = self.view.center
    
            container.addSubview(activityView!)
            //self.view.addSubview(container)
            //activityView?.startAnimating()
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        showActivityIndicatory()
        delegateCanv()
        
        setSelectedImage = selectedImage
        guard let url = URL(string: setSelectedImage ?? "") else {return }
        if let data = try? Data(contentsOf: url){
            imageView.image = UIImage(data: data)
            canvasView = PKCanvasView.init(frame: imageView.frame)
            canvasView.isOpaque = false
            delegateCanv()
            view.addSubview(canvasView)
            
        
            
        }
        
        
    }
    
    func setSize() -> CGRect {
        let containerRatio = self.imageView.frame.size.height/self.imageView.frame.size.width
        let imageRatio = self.imgForMarkup!.size.height/self.imgForMarkup!.size.width
        if containerRatio > imageRatio {
            return self.getHeight()
        }else {
            return self.getWidth()
        }
    }
    func getHeight() -> CGRect {
        let containerView = self.imageView!
        let image = self.imgForMarkup!
        let ratio = containerView.frame.size.width / image.size.width
        let newHeight = ratio * image.size.height
        let size = CGSize(width: containerView.frame.width, height: newHeight)
        var yPosition = (containerView.frame.size.height - newHeight) / 2
        yPosition = (yPosition < 0 ? 0 : yPosition) + containerView.frame.origin.y
        let origin = CGPoint.init(x: 0, y: yPosition)
        return CGRect.init(origin: origin, size: size)
    }
    
    func getWidth() -> CGRect {
        let containerView = self.imageView!
        let image = self.imgForMarkup!
        let ratio = containerView.frame.size.height / image.size.height
        let newWidth = ratio * image.size.width
        let size = CGSize(width: newWidth, height: containerView.frame.height)
        let xPosition = ((containerView.frame.size.width - newWidth) / 2) + containerView.frame.origin.x
        let yPosition = containerView.frame.origin.y
        let origin = CGPoint.init(x: xPosition, y: yPosition)
        return CGRect.init(origin: origin, size: size)
    }
    

    @IBAction func ShareImage(_ sender: Any) {
     desplayAlert()
    }
    
    func saveImage(screenShot : UIImage,nameText:String){
        
        Utils.start(view: self.view,activityIndicator: self.activityView!, isUserInteractionEnabled: false)
        
        ProductApi.uploadImageToFirebase(screenShot: screenShot, nameText: nameText) { check, urlDownload in
            
            Utils.stop(view: self.view, activityIndicator: self.activityView!)
            ProductApi.AddDrawProduct(productImage: urlDownload ?? "", productName: "Test")
            
        }
        
        
        
//        DispatchQueue.main.async {
//            let screeSheet = UIActivityViewController(activityItems: [screenShot], applicationActivities: nil)
//
//            self.present(screeSheet, animated: true, completion: nil)
//        }
    }
    
    func desplayAlert(){
        var textFieldName = UITextField()
        let alert = UIAlertController(title: "Name of project", message: "add Name", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Add To my project", style: .default){ action in
            
            let screenShot = self.view.takeScreenshot()
            self.saveImage(screenShot: screenShot, nameText: textFieldName.text ?? "")
            
        }
        
        alert.addTextField { field in
            field.placeholder = "Name"
            textFieldName = field
        }
        alert.addAction(ok)
        present(alert, animated: true )
        
        
        
    }
}








