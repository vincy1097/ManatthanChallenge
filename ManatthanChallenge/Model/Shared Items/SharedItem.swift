//
//  SharedItem.swift
//  Manhattan Challenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Michele De Sena. All rights reserved.
//
//

import Foundation
import UIKit
class SharedItem{
    var name:String
    var image:UIImage
    var price:Int
    var booked = false
    
    
    
    init (name: String,image: UIImage, credits price:Int){
        self.name = name
        self.image = image
        self.price = price
    }
    static func ==(item1:SharedItem,item2:SharedItem)->Bool{
        return item1.name == item2.name
    }
}
