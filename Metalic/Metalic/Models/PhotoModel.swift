//
//  PhotoModel.swift
//  Metalic
//
//  Created by Anas Hamad on 02/06/1443 AH.
//

import Foundation


struct HeroModel {
    var PhotoImage : String?
    var PhotoID : String?
}
let service = ["Machining Lathe","Machining Milling","Welding","hydraulic service","CNC"]

var photo = [HeroModel(PhotoImage: "Machining Lathe", PhotoID: "1"),
HeroModel(PhotoImage: "Machining Milling", PhotoID: "2"),
HeroModel(PhotoImage: "Welding", PhotoID: "3"),
HeroModel(PhotoImage: "hydraulic service", PhotoID: "4"),
HeroModel(PhotoImage: "CNC", PhotoID: "5")]
