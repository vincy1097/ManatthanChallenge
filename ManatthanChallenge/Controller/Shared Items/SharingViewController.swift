//
//  SharingViewController.swift
//  Manhattan Challenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Michele De Sena. All rights reserved.
//
//


import UIKit


class SharingViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    let items = Items.shared
                                                                                                                            let database = Database.shared
    let itemArray = Database.shared.itemArray
    //MARK:Actions and outlets
    @IBAction func addItem(_ sender: UIButton) {
        performSegue(withIdentifier: "modalityAddItem", sender: sender)
    }
    
    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.isScrollEnabled = true
            collectionView.alwaysBounceHorizontal = true
            
        }
    }
    
    
    //MARK:UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        items.indexPath = indexPath
    }
    
    //MARK:UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sharedItem", for: indexPath)
        let item = itemArray[indexPath.item]
        if let mycell = cell  as? SharedItemCollectionViewCell{
         mycell.itemImage.image = item.image
         mycell.itemName.text = item.name
         mycell.itemPrice.text = "credits: \(item.price)"
        }
        return cell
        
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        self.collectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
                                                                                                        //database.saveItem(name: "ciaoooo", price: 20)
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
