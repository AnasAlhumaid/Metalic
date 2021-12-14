//
//  AnglePressure.swift
//  Metalic
//
//  Created by Anas Hamad on 08/05/1443 AH.
//

import Foundation
import UIKit



class SpeedGear: UIViewController{
@IBOutlet var firstInput: UITextField!
@IBOutlet var secondInput: UITextField!
@IBOutlet var thirdInput: UITextField!
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var SecondLabel: UILabel!
    @IBOutlet var therdLabel: UILabel!
    @IBOutlet var imageDetail: UIImageView!
    @IBOutlet var converValue: UILabel!
var choosenValue:ChangeInput = .firstSpeed
var segmantUnit: UISegmentedControl?


override func viewDidLoad() {
    super.viewDidLoad()
    setUI(changeInput: .firstSpeed)
    let tap = UITapGestureRecognizer(target: self, action: #selector(dismissTap))
        view.addGestureRecognizer(tap)
    
    imageDetail.image = UIImage(named: "GearSpeed")
    
    
    
}
func setUI(changeInput:ChangeInput) {
    
    firstInput.keyboardType = .decimalPad
    secondInput.keyboardType = .decimalPad
    thirdInput.keyboardType = .decimalPad
    
    switch changeInput {
    case .firstSpeed:
        firstLabel.text = "secSpeed"
        SecondLabel.text = "secTeeth"
        therdLabel.text = "firTeeth"
    case .fristTeeth:
        firstLabel.text = "secSpeed"
        SecondLabel.text = "secTeeth"
        therdLabel.text = "firSpeed"
    case .secondSpeed:
        firstLabel.text = "firSpeed"
        SecondLabel.text = "secTeeth"
        therdLabel.text = "firTeeth"
    case .secondteeth:
        firstLabel.text = "secSpeed"
        SecondLabel.text = "firSpeed"
        therdLabel.text = "firTeeth"
        
    }
    
}

// MARK: - calculating bottuns
@IBAction func actionBottun(_ sender: Any) {
    
    switch choosenValue {
    case .firstSpeed:
        
        let convertedValue = firstSpeed(secSpeed: firstInput.text, secTeeth: secondInput.text, firTeeth: thirdInput.text)
        
        converValue.text = "\(convertedValue)"
        
        
    case .secondSpeed :
        
        let convertedValue = secondSpeed(firSpeed: firstInput.text, secTeeth: secondInput.text, firTeeth: thirdInput.text)
        
        converValue.text = "\(convertedValue)"
        
    case .fristTeeth:
        
        let convertedValue = firstTeeth(secSpeed: firstInput.text, secTeeth: secondInput.text, firSpeed: thirdInput.text)
        
        converValue.text = "\(convertedValue)"
        
    case .secondteeth:
        
        let convertedValue = secondTeeth(secSpeed: firstInput.text, firSpeed: secondInput.text, firTeeth: thirdInput.text)
        
        converValue.text = "\(convertedValue)"
        
    }
}

// MARK: -segmant selection

@IBAction func segGearSpeedTypes(_ sender: UISegmentedControl) {
    
    switch sender.selectedSegmentIndex {
        
    case 0:
        setUI(changeInput: .firstSpeed)
        choosenValue = .firstSpeed
    case 1:
        setUI(changeInput: .fristTeeth)
        choosenValue = .fristTeeth
    case 2:
        setUI(changeInput: .secondSpeed)
        choosenValue = .secondSpeed
    case 3:
         setUI(changeInput: .secondteeth)
        choosenValue = .secondteeth
    default:
        print("")
    }
}
// MARK: - list calculation for each case in segmant

func firstSpeed(secSpeed:String? , secTeeth:String?, firTeeth:String?) -> String {
    
    guard let secSpeed : Double = Double(firstInput.text ?? "nil") else {return ""}
    guard let secTeeth : Double = Double(secondInput.text ?? "nil") else {return ""}
    guard let firTeeth : Double = Double(thirdInput.text ?? "nil") else {return ""}
    let frSpeed = ((secSpeed * firTeeth) / secTeeth)
    let results = "\(String(format:"%.2f",frSpeed))"
    converValue.text = results
    return results
    
}
func secondSpeed(firSpeed:String? , secTeeth:String?, firTeeth:String?) -> String {
    
    guard let firSpeed : Double = Double(firstInput.text ?? "nil") else {return ""}
    guard let secTeeth : Double = Double(secondInput.text ?? "nil") else {return ""}
    guard let firTeeth : Double = Double(thirdInput.text ?? "nil") else {return ""}
    let secSpeed = ((firSpeed * firTeeth) / secTeeth)
    let results = "\(String(format:"%.2f",secSpeed))"
    converValue.text = results
    return results
    
}
func firstTeeth(secSpeed:String? , secTeeth:String?, firSpeed:String?) -> String {
    
    
    guard let secSpeed : Double = Double(firstInput.text ?? "nil") else {return ""}
    guard let secTeeth : Double = Double(secondInput.text ?? "nil") else {return ""}
    guard let firSpeed : Double = Double(thirdInput.text ?? "nil") else {return ""}
    let firTeeth = ((secSpeed * secTeeth) / firSpeed)
    let results = "\(String(format:"%.2f",firTeeth))"
    converValue.text = results
    return results
    
}
func secondTeeth(secSpeed:String?, firSpeed:String?, firTeeth:String?) -> String {
    
    
    guard let secSpeed : Double = Double(firstInput.text ?? "nil") else {return ""}
    guard let firSpeed : Double = Double(secondInput.text ?? "nil") else {return ""}
    guard let firTeeth : Double = Double(thirdInput.text ?? "nil") else {return ""}
    let secTeeth = ((firSpeed * firTeeth) / secSpeed)
    let results = "\(String(format:"%.2f",secTeeth))"
    converValue.text = results
    return results
    
}
@objc  func dismissTap() {
    firstInput.resignFirstResponder()
    secondInput.resignFirstResponder()
    thirdInput.resignFirstResponder()
    
  }
}
