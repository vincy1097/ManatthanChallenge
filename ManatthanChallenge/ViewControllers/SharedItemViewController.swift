//
//  SharedItemViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit

class SharedItemViewController: UIViewController {
    let item = Items.shared
    let items = Items.shared.getItems()
    var index:Int?

    @IBOutlet weak var coverImageView: UIImageView!
    
    
    @IBOutlet weak var creditsLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
            }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let index = item.indexPath else {
            self.index = 0
            return
        }
        self.index = index.item

        coverImageView.image = items[self.index!].image
        creditsLabel.text = "credits: \(items[self.index!].price)"
        self.navigationItem.title = items[self.index!].name
        self.navigationItem.largeTitleDisplayMode = .never


    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
