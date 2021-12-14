//
//  MOD.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit



class Mod : UIViewController{
    
    
    @IBOutlet var ModDetailImage: UIImageView!
    @IBOutlet var textfieldOD: UITextField!
    @IBOutlet var textfiledNT: UITextField!
    @IBOutlet var conversionLabel: UILabel!
    @IBOutlet var segmantUnit: UISegmentedControl!
    var numberOfTeeth :Double?
    var numberOutDimeter : Double?
    var conversionType = ConversionType.mm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissTap))
            view.addGestureRecognizer(tap)
        
        ModDetailImage.image = UIImage(named: "Gear-Mod")
        
    }
    func calculateMM(NumberOfteaath:Double, OutDimeter:Double) -> String {
        guard let intNumberNT : Double = Double(textfiledNT.text ?? "nil") else {return ""}
        guard let intNumberOD : Double = Double(textfieldOD.text ?? "nil") else {return ""}
        
        
        let resDP = ((intNumberOD * intNumberNT) / intNumberNT + 2)
        let MOD = ((resDP)/intNumberNT)
        let resultMM = "\(String(format:"%.2f",MOD)) MOD"
        conversionLabel.text = resultMM
        return resultMM
    }
    func calculateInch(numberOfTeeth:Double, outDimeter:Double) -> String {
        guard let intNumberNT : Double = Double(textfiledNT.text ?? "nil") else { return "" }
        guard let intNumberOD : Double = Double(textfieldOD.text ?? "nil") else { return "" }
        let resDP = ((intNumberOD * intNumberNT) / intNumberNT + 2)
        let resultInch = "\(String(format:"%.2f",resDP)) Dimetral"
        conversionLabel.text = resultInch
        
        return resultInch
        
    }
    @IBAction func calculateButton(_ sender: Any) {
        var numberOfTeeth = 0.0
        var outDimeter = 0.0
        guard let intNumberNT : Double = Double(textfiledNT.text ?? "nil") else {return}
        guard let intNumberOD : Double = Double(textfieldOD.text ?? "nil") else {return}
        numberOfTeeth = intNumberNT
        outDimeter = intNumberOD
        
        switch conversionType {
        case .mm:
            
           let convertedValue = calculateMM(NumberOfteaath: numberOfTeeth , OutDimeter: outDimeter)
            conversionLabel.text = "\(convertedValue) "
        case .inch :
            let convertedValue = calculateInch(numberOfTeeth: numberOfTeeth ,outDimeter: outDimeter)
            conversionLabel.text = "\(convertedValue)"
            
        }
        
    }
    @IBAction func segmantUnitAction (_ sender: Any, forEvent event: UIEvent) {
        switch segmantUnit.selectedSegmentIndex {
        case 0:
            conversionType = .mm
            conversionLabel.text = "0.0 Module"
        case 1:
            conversionType = .inch
            conversionLabel.text = "0.0 Dimetral"
        default:
            conversionType = .mm
            conversionLabel.text = "0.0 Module"}
    }
    @objc  func dismissTap() {
        textfieldOD.resignFirstResponder()
        textfiledNT.resignFirstResponder()

      }
    
    
    
    
    
    
    
    
    
    
    
    
    
}
