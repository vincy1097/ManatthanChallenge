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
    let photo = [#imageLiteral(resourceName: "Foto del 23-10-17 alle 20.21"),#imageLiteral(resourceName: "Foto del 30-11-17 alle 17.16"), #imageLiteral(resourceName: "Foto del 21-10-17 alle 13.24"),#imageLiteral(resourceName: "Foto del 23-10-17 alle 20.21"),#imageLiteral(resourceName: "Foto del 30-11-17 alle 17.16"), #imageLiteral(resourceName: "Foto del 21-10-17 alle 13.24")]
    
   
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

        if let mycell = cell  as? SharedItemCollectionViewCell{
         mycell.sharedItemImage.image = photo[indexPath.item]
         mycell.itemName.text = "Ciao sono il nome"
         mycell.itemPrice.text = "Ciao sono il cognome"
            
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
