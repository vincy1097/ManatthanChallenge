//
//  Activity.swift
//  Manhattan Challenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Michele De Sena. All rights reserved.
//

import Foundation
import UIKit
class Activity{
    var name: String
    var image:UIImage
    var credits:Int
    var creator:User
    var executor:User?
    var completed = false
    var taken = false
    var description:String{
        get{
            return self.name
        }
        set{
            self.name = newValue
        }
    }
    
    var photo:UIImage{
        get{
            return self.image
        }
        set{
            self.image = newValue
        }
    }
    var reward:Int{
        get{
            return self.credits
        }
        set{
            self.credits = newValue
        }
    }
    
    init (name:String, image:UIImage, reward credits:Int, addedBy creator:User){
        self.name = name
        self.image = image
        self.credits = credits
        self.creator = creator
    }
    
}
