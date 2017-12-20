//
//  AddIActivityViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 18/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit
import CloudKit

class AddIActivityViewController: UIViewController,UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UITextViewDelegate{
    var photo:UIImage?
    var creator:User = User.shared
    var deadline:Date?
    let activities = Activities.shared
    let icons:[UIImage] = [#imageLiteral(resourceName: "aquarium"),#imageLiteral(resourceName: "bed"),#imageLiteral(resourceName: "aspirapolvere"),#imageLiteral(resourceName: "closet"),#imageLiteral(resourceName: "detersivo"),#imageLiteral(resourceName: "kettle"),#imageLiteral(resourceName: "table"),#imageLiteral(resourceName: "washing-machine")]
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //    MARK:Actions and outlets

   
    @IBAction func onTapCancel(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onTapDone(_ sender: UIBarButtonItem) {
        
        
        guard let name = self.activityNameTextField.text else{
            return
        }
        guard let photo = self.photo else {
            return
        }
        
        guard let credits = self.creditsTextField.text else {
            return
        }
        
        let deadline = self.datePicker.date
        
        
       guard let reward = Int(credits) else {return}
        
        let activity = Activity(name:name,image:photo,reward: reward, addedBy: creator, deadline:deadline)
        
        if let description = self.noteTextView.text{
            activity.notes = description
        }
            activities.add(activity: activity)
            self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var creditsTextField: UITextField!{
        didSet{
            creditsTextField.delegate = self
        }
    }
    
    @IBOutlet weak var activityNameTextField: UITextField!{
        didSet{
            activityNameTextField.delegate = self
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    

    
    @IBOutlet weak var collectionView: UICollectionView!{
        didSet{
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.isScrollEnabled = true
            collectionView.alwaysBounceHorizontal = true
            collectionView.showsHorizontalScrollIndicator = false
        }
    }
    
    @IBOutlet weak var noteTextView: UITextView!{
        didSet{
            noteTextView.delegate = self
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "activityIcon", for: indexPath)
        if let mycell = cell as? itemIconCell{
            mycell.icon.image = icons[indexPath.item]
            return mycell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.cellForItem(at: indexPath)?.isHighlighted = true
        self.photo = icons[indexPath.item]
    }
    
    
    
}


