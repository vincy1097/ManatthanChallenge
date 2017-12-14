//
//  SharedItemViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit

class SharedItemViewController: UIViewController {

    var coverImage:UIImage?
    var itemName:String?
    var itemPrice:Int?

    @IBOutlet weak var coverImageView: UIImageView!{
        didSet{
            coverImageView.image = coverImage
        
        }
    }
    
    
    @IBOutlet weak var creditsLabel: UILabel!{
        didSet{
            creditsLabel.text = "credits: \(String(describing: itemPrice))"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = itemName
        self.navigationItem.largeTitleDisplayMode = .never
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
