//
//  ActivityViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 19/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit

class ActivityViewController: UIViewController {
    let user = User.shared
    let activities = Activities.shared
    let bookings = Bookings.shared
    let index = Activities.shared.selectedIndex
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var takeButton: UIButton!
    
    @IBOutlet weak var coverImage: UIImageView!{
        didSet{
            coverImage.image = activities.getActivities()[index!].image
        }
    }
    
    @IBOutlet weak var reward: UILabel!{
        didSet{
            reward.text = "Reward: \(activities.getActivities()[index!].credits)"
        }
    }
    
    @IBOutlet weak var deadline: UILabel!{
        didSet{
            deadline.text = "Deadline: \(activities.getActivities()[index!].deadline)"
        }
    }
    
    @IBOutlet weak var notes: UITextView!{
        didSet{
            notes.text = "\(activities.getActivities()[index!].notes ?? "no notes")"
        }
    }
    
    @IBAction func onTapTake(_ sender: UIButton) {
        if let _ = user.takenActivities {
            user.takenActivities!.append(activities.getActivities()[index!])
        }else{
            user.takenActivities = [activities.getActivities()[index!]]
        }
        self.takeButton.isHidden = true
    }
    
}
