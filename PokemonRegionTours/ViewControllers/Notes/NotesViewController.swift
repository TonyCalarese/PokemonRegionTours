//
//  NotesViewController.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/19/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

//Code is highly based off of the homepwner by Big Nerd Ranch © 2015
class NotesViewController : UITableViewController {

    var NotesStore = ItemStore()
    
    @IBAction func addNewNotes(_ sender: Any) {
        // Create a new Item and add it to the store
        let newText = "New Note"

        NotesStore.createItem(name: newText, desc: newText, image: nil, of: Notes(name: "", desc: "", image: nil))// Figure out where that item is in the array
        
        let index = NotesStore.allItems.count - 1
        let indexPath = IndexPath(row: index, section: 0)
                           
        tableView.insertRows(at: [indexPath], with: .automatic)
        

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create an instance of UITableViewCell, with default appearance
            let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath) as! NotesTableViewCell
            
            let item = NotesStore.allItems[indexPath.row]
            cell.nameLabel.text = item.name
    
            return cell
    }

}
