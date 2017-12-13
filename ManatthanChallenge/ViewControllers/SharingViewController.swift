//
//  SharingViewController.swift
//  Manhattan Challenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Michele De Sena. All rights reserved.
//
//to do list:
/*
 Settare la regolazione automatica delle dimensioni della view e della collection view in base al numero di elementi nella collection
 */

import UIKit


class SharingViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    let items = Items.shared
    
    
   
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.isScrollEnabled = true
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//       return items.getItems().count
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sharedItem", for: indexPath)
        let item = items.getItems()[indexPath.item]
        if let mycell = cell  as? SharedItemCollectionViewCell{
         mycell.sharedItemImage.image = item.image
         mycell.itemName.text = item.description
         mycell.itemPrice.text = "\(item.price)"
            
        }
        
        
        return cell
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
