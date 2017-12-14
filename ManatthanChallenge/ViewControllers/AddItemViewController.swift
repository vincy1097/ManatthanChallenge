//
//  AddItemViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 14/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit


class AddItemViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    let itemIcons:[UIImage] = []
    let items = Items.shared
    var photo:UIImage?
    var itemName:String?
    var itemPrice:Int?
    @IBOutlet weak var credits: UITextField!
    @IBOutlet weak var name: UITextField!
    let user = User.shared
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemIcons.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reusable", for: indexPath)
        if let mycell = cell as? itemIconCell {
            mycell.icon.image = itemIcons[indexPath.item]
        }
        return cell
    }

    
    
    @IBOutlet weak var iconCollectionView: UICollectionView!{
        didSet{
            iconCollectionView.delegate = self
            iconCollectionView.dataSource = self
        }
    }
    @IBAction func onTapCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapDone(_ sender: UIBarButtonItem) {
        guard let name = self.name.text else{
            return
        }
        guard let photo = self.photo else {
            return
        }
        
        guard let credits = self.credits.text else {
            return
        }
        if let price = Int(credits) {
        let item = SharedItem(name: name, image:photo, credits: price, addedBy: user)
        items.addItem(item: item)
        self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       let icon = itemIcons[indexPath.item]
        collectionView.cellForItem(at: indexPath)?.isHighlighted = true
        self.photo = icon
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
