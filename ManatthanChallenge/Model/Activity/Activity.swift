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
    var notes:String?
    var image:UIImage
    var credits:Int
    var creator:User
    var executor:User?
    var completed = false
    var deadline:Date
    var takenDate:Date?
    var taken = false
  
    
    init (name:String, image:UIImage, reward credits:Int, addedBy creator:User, deadline:Date){
        self.name = name
        self.image = image
        self.credits = credits
        self.creator = creator
        self.deadline = deadline
    }
    
}
