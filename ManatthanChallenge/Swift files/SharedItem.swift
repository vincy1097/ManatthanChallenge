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
    var user:User
    var booked = false
    var credits:Int{
        get{
            return price
        }
        set{
            price = newValue
        }
    }
    var description:String{
        get{
            return self.name
        }
        set{
            self.name = newValue
        }
    }
    
    
    init (name: String,image: UIImage, credits price:Int, addedBy user:User){
        self.name = name
        self.image = image
        self.price = price
        self.user = user
    }
    
}
