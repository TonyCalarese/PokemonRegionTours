//
//  NotesViewController.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/19/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class NotesViewController : UITableViewController {

    
    @IBAction func addNewItem(_ sender: Any) {
        // Create a new Item and add it to the store
        let newItem = ItemStore.createItem(Itemable)
                 
                 // Figure out where that item is in the array
                 if let index = itemStore.allItems.index(of: newItem) {
                     let indexPath = IndexPath(row: index, section: 0)
                     
                     // Insert this new row into the table.
                     tableView.insertRows(at: [indexPath], with: .automatic)
                 }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
