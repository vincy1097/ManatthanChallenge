//
//  User.swift
//  Manhattan Challenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Michele De Sena. All rights reserved.
//

import Foundation

class User {
    var name:String
    var surname:String
    var emailAddress:String
    var password:String
    init (name: String, surname:String, email emailAddress:String, password:String){
        self.name = name
        self.surname = surname
        self.emailAddress = emailAddress
        self.password = password
    }
}