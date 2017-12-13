//
//  Items.swift
//  Manhattan Challenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Michele De Sena. All rights reserved.
//

import Foundation
class Items{
    static let shared = Items()
    var sharedItems:[SharedItem]?
    func getItems()->[SharedItem]{
        if let items = self.sharedItems{
            return items
        }else{
            return []
        }
    }
    func addItem(item:SharedItem){
        self.sharedItems?.append(item)
    }
}
