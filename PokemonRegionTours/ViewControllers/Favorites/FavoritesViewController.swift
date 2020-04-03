//
//  FavoritesViewController.swift
//  PokemonRegionTours
//
//  Created by Nick Garvey and Tony Calarese on 3/19/20.
//  Copyright © 2020 Calarese & Garvey Innovation. All rights reserved.
//

import UIKit

class FavoritesViewController : UITableViewController {
    
    let favStore: ItemStore = ItemStore()
    var plistURL : URL {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documents.appendingPathComponent("notes.plist")
    }
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        favStore.allItems = [Itemable]()
        let _ = favStore.loadItems(from: "destinations", of: Destination.self)
        let _ = favStore.loadItems(file: plistURL, of: Notes.self)
        favStore.allItems = favStore.allItems.filter({ $0.favorite })
        tableView.reloadData()
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favStore.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let item = favStore.allItems[indexPath.row]
        
        if item is Destination {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell") as! ImageTableViewCell
            cell.title.text = item.name
            if let imgString = item.image {
                cell.icon.image = UIImage(named: imgString)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath) as! NotesTableViewCell
            
            cell.nameLabel.text = item.name
    
            return cell
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "notes":
            if let row = tableView.indexPathForSelectedRow?.row {
                let notes = favStore.allItems[row]
                let vc = segue.destination as! NotesDetailViewController
                vc.notes = notes as? Notes
            }
        case "dest":
            if let row = tableView.indexPathForSelectedRow?.row {
                let dest = favStore.allItems[row]
                let vc = segue.destination as! DestinationDetailViewController
                vc.destination = dest as? Destination
            }
        default:
            preconditionFailure("Unexpected segue identifier")
        }
    }

}
