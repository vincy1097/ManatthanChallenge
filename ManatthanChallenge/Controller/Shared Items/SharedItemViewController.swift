//
//  SharedItemViewController.swift
//  ManatthanChallenge
//
//  Created by Michele De Sena on 13/12/2017.
//  Copyright © 2017 Vincenzo Izzo. All rights reserved.
//

import UIKit

class SharedItemViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let bookings = Bookings.shared
    let items = Items.shared
    
    @IBOutlet weak var itemNameLabel: UILabel!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let indexPath = items.indexPath else{
            return 1
        }
        return bookings.getBookings(forItem: items.getItems()[indexPath.item]).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        guard let index = items.indexPath else {
            return cell
        }
        cell.textLabel?.text = bookings.getBookings(forItem: items.getItems()[index.row])[indexPath.row].user.name
        cell.detailTextLabel?.text = "from:\(bookings.getBookings(forItem: items.getItems()[index.row])[indexPath.row].startDateTime) to: \(bookings.getBookings(forItem: items.getItems()[index.row])[indexPath.row].endingDateTime)"
        return cell
    }
    
   

    //MARK:Outlets
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var creditsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let indexPath = items.indexPath else {
            
            return
        }
        let index = indexPath.item

        coverImageView.image = items.getItems()[index].image
        creditsLabel.text = "credits: \(items.getItems()[index].price)"
        self.navigationItem.title = items.getItems()[index].name
        self.navigationItem.largeTitleDisplayMode = .never

    }
    
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
