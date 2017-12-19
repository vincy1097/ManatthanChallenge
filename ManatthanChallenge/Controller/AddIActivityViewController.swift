//
//  AddIActivityViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 18/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit
import CloudKit

class AddIActivityViewController: UIViewController {
    var photo:UIImage?
    var creator:User = User.shared
    var deadline:Date?
    let activities = Activities.shared

    

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
        if let reward = Int(credits) {
            let activity = Activity(name:name,image:photo,reward: reward, addedBy: creator, deadline:deadline!)
            
            self.dismiss(animated: true, completion: nil)
            activities.add(activity: activity)
        }

        
    }
    
    @IBOutlet weak var creditsTextField: UITextField!
    
    @IBOutlet weak var activityNameTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var noteTextView: UITextView!
    
    
    
}


