//
//  SharedItemViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit

class SharedItemViewController: UIViewController {
    
    var item:SharedItem?

    @IBOutlet weak var coverImageView: UIImageView!{
        didSet{
            coverImageView.image = item?.image
        }
    }
    
    
    @IBOutlet weak var creditsLabel: UILabel!{
        didSet{
            if let currentItem = item {
                creditsLabel.text = "credits: \(currentItem.credits)"
            }else{
                creditsLabel.text = "No element selected"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = item?.name
        self.navigationItem.largeTitleDisplayMode = .never
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
