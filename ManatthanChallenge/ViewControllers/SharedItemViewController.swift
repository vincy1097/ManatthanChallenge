//
//  SharedItemViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit

class SharedItemViewController: UIViewController {
    let items = Items.shared
    
    var index:Int?

    //MARK:Outlets
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var creditsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let indexPath = items.indexPath else {
            index = 0
            return
        }
        index = indexPath.item

        coverImageView.image = items.getItems()[index!].image
        creditsLabel.text = "credits: \(items.getItems()[index!].price)"
        self.navigationItem.title = items.getItems()[index!].name
        self.navigationItem.largeTitleDisplayMode = .never


    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
