//
//  NotesViewController.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/19/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class NotesViewController : UITableViewController {

    var NotesStore = ItemStore<Notes>()
    
    @IBAction func addNewNotes(_ sender: Any) {
        // Create a new Item and add it to the store
            let newItem = NotesStore.createItem()
                       
                       // Figure out where that item is in the array
        if let index = NotesStore.allItems.firstIndex(of: newItem) {
                let indexPath = IndexPath(row: index, section: 0)
                           
                           // Insert this new row into the table.
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the "showItem" segue
        
        switch segue.identifier {
        case "showItem"?:
            // Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let item = NotesStore.allItems[row]
               // let detailViewController = segue.destination as! DetailViewController //create new segue
                //detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    
    }
    
    override func tableView(_ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
            // If the table view is asking to commit a delete command...
           
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NotesStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            // Create an instance of UITableViewCell, with default appearance
            let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell",
                for: indexPath) as! NotesTableViewCell
            
         
            let item = NotesStore.allItems[indexPath.row]
            
            cell.nameLabel.text = item.name
    
            
            return cell
    }

}
