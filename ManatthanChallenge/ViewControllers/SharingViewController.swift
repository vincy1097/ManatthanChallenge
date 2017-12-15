//
//  SharingViewController.swift
//  Manhattan Challenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Michele De Sena. All rights reserved.
//
//to do list:


import UIKit


class SharingViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource{
    let items = Items.shared
    var currentIndex:Int?
    
   
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        
         self.collectionView.reloadData()
         
    }
    
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.getItems().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sharedItem", for: indexPath)
        let item = items.getItems()[indexPath.item]
        if let mycell = cell  as? SharedItemCollectionViewCell{
         mycell.itemImage.image = item.image
         mycell.itemName.text = item.description
         mycell.itemPrice.text = "credits: \(item.price)"
            
        }
        return cell
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.currentIndex = indexPath.item
        performSegue(withIdentifier: "showItem", sender: self)
        print("cell has been selected")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showItem"{
            guard let destination = segue.destination as? SharedItemViewController else{
                return
            }
            destination.item = items.getItems()[self.currentIndex!]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
