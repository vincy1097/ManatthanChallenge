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
  
    var sharedItems:[SharedItem] = [SharedItem(name: "name", image:#imageLiteral(resourceName: "Foto del 23-10-17 alle 20.21"), credits: 22, addedBy: User.shared)]
    func getItems()->[SharedItem]{
        //if let items = self.sharedItems{
            return sharedItems
       // }else{
        //   print("returning a void array")
        //    return []
       // }
    }
    func addItem(item:SharedItem){
      //  if let _ = self.sharedItems{
            self.sharedItems.append(item)
       // }else{
       //     self.sharedItems = [item]
       // }
        print(self.getItems())
    }
}
